package middleware

import (
	"bytes"
	"encoding/json"
	"log"
	"net"
	"net/http"
	"sync"
	"time"
)

const (
	headerXFF            = "X-Forwarded-For"
	defaultLogBufferSize = 512
)

var (
	logBufPool = sync.Pool{
		New: func() interface{} {
			b := new(bytes.Buffer)
			b.Grow(defaultLogBufferSize)
			return b
		},
	}

	logObjPool = sync.Pool{
		New: func() interface{} {
			return new(AccessLogFmt)
		},
	}

	logResWriterPool = sync.Pool{
		New: func() interface{} {
			return new(loggableResponseWriter)
		},
	}
)

// AccessLogFmt is
type AccessLogFmt struct {
	Timestamp              string   `json:"@timestamp,omitempty"`
	UserAgent              string   `json:"user_agent.original,omitempty"`
	HTTPRequestMethod      string   `json:"http.request.method,omitempty"`
	HTTPRequestHeaderXFF   []string `json:"http.request.header.xff,omitempty"`
	HTTPResponseStatusCode int      `json:"http.response.status_code,omitempty"`
	HTTPResponseBodyBytes  int      `json:"http.response.body.bytes,omitempty"`
	HTTPVersion            string   `json:"http.version,omitempty"`
	HostIP                 string   `json:"host.ip,omitempty"`
	URLOriginal            string   `json:"url.original,omitempty"`
	SourceIP               string   `json:"source.ip,omitempty"`
	ProcessingTime         int64    `json:"proccesing_time,omitempty"`
}

func (alf *AccessLogFmt) reset(r *http.Request, statusCode int, bodySize int, start *time.Time) {
	hostIP := r.Host
	if ip, _, err := net.SplitHostPort(hostIP); err == nil {
		hostIP = ip
	}

	remoteIP := r.RemoteAddr
	if ip, _, err := net.SplitHostPort(remoteIP); err == nil {
		remoteIP = ip
	}

	var xffAddrs []string
	if addrs, ok := r.Header[headerXFF]; ok && len(addrs) > 0 {
		xffAddrs = addrs
	}

	alf.Timestamp = start.Local().Format(time.RFC3339Nano)
	alf.UserAgent = r.UserAgent()
	alf.HTTPRequestMethod = r.Method
	alf.HTTPRequestHeaderXFF = xffAddrs
	alf.HTTPResponseStatusCode = statusCode
	alf.HTTPResponseBodyBytes = bodySize
	alf.HTTPVersion = r.Proto
	alf.HostIP = hostIP
	alf.URLOriginal = r.URL.String()
	alf.SourceIP = remoteIP
	alf.ProcessingTime = time.Now().Sub(*start).Microseconds()
}

type loggableResponseWriter struct {
	orig   http.ResponseWriter
	status int
	length int
}

// Header is
func (w *loggableResponseWriter) Header() http.Header {
	return w.orig.Header()
}

// WriteHeader is
func (w *loggableResponseWriter) WriteHeader(s int) {
	w.status = s
	w.orig.WriteHeader(s)
}

// Write is
func (w *loggableResponseWriter) Write(b []byte) (n int, err error) {
	n, err = w.orig.Write(b)
	w.length += n
	return
}

func (w *loggableResponseWriter) reset(ow http.ResponseWriter) {
	w.orig = ow
	w.status = http.StatusOK
	w.length = 0
}

// AccessLog is
func AccessLog(next http.Handler, logger *log.Logger) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		start := time.Now()

		lrw := logResWriterPool.Get().(*loggableResponseWriter)
		defer logResWriterPool.Put(lrw)
		lrw.reset(w)

		next.ServeHTTP(lrw, r)

		buf := logBufPool.Get().(*bytes.Buffer)
		defer logBufPool.Put(buf)
		buf.Reset()

		obj := logObjPool.Get().(*AccessLogFmt)
		defer logObjPool.Put(obj)
		obj.reset(r, lrw.status, lrw.length, &start)

		if err := json.NewEncoder(buf).Encode(obj); err == nil {
			logger.Writer().Write(buf.Bytes())
		} else {
			logger.Print(err)
		}
	})
}
