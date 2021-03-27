package middleware

import (
	"fmt"
	"log"
	"net"
	"net/http"
)

const (
	headerXFF  = "X-Forwarded-For"
	logFmtBase = "%s %d %s %s%s from %s"
	logFmtXFF  = "%s forwarded for %+v"
)

type responseWriterLoggable struct {
	orig   http.ResponseWriter
	status int
}

// AccessLog is
func AccessLog(next http.Handler, logger *log.Logger) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		rw := newResponseWriterLoggable(w)
		next.ServeHTTP(rw, r)
		status := rw.status
		remoteIP := extractIP(r.RemoteAddr)

		msg := fmt.Sprintf(logFmtBase, r.Proto, status, r.Method, r.Host, r.URL, remoteIP)
		if addrs, ok := r.Header[headerXFF]; ok && len(addrs) > 0 {
			msg = fmt.Sprintf(logFmtXFF, msg, addrs)
		}

		logger.Print(msg)
	})
}

func newResponseWriterLoggable(w http.ResponseWriter) *responseWriterLoggable {
	return &responseWriterLoggable{orig: w, status: http.StatusOK}
}

// Header is
func (w *responseWriterLoggable) Header() http.Header {
	return w.orig.Header()
}

// Write is
func (w *responseWriterLoggable) Write(b []byte) (int, error) {
	return w.orig.Write(b)
}

// WriteHeader is
func (w *responseWriterLoggable) WriteHeader(s int) {
	w.status = s
	w.orig.WriteHeader(s)
}

func extractIP(addr string) string {
	ip, _, err := net.SplitHostPort(addr)
	if err != nil {
		// missing port in address
		return addr
	}

	return ip
}
