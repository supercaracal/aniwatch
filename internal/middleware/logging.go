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

type loggableResponseWriter struct {
	orig   http.ResponseWriter
	status int
}

// Header is
func (w *loggableResponseWriter) Header() http.Header {
	return w.orig.Header()
}

// Write is
func (w *loggableResponseWriter) Write(b []byte) (int, error) {
	return w.orig.Write(b)
}

// WriteHeader is
func (w *loggableResponseWriter) WriteHeader(s int) {
	w.status = s
	w.orig.WriteHeader(s)
}

// AccessLog is
func AccessLog(next http.Handler, logger *log.Logger) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		rw := &loggableResponseWriter{orig: w, status: http.StatusOK}
		next.ServeHTTP(rw, r)
		remoteIP := extractIP(r.RemoteAddr)
		msg := fmt.Sprintf(logFmtBase, r.Proto, rw.status, r.Method, r.Host, r.URL, remoteIP)
		if addrs, ok := r.Header[headerXFF]; ok && len(addrs) > 0 {
			msg = fmt.Sprintf(logFmtXFF, msg, addrs)
		}
		logger.Print(msg)
	})
}

func extractIP(addr string) string {
	ip, _, err := net.SplitHostPort(addr)
	if err != nil {
		// missing port in address
		return addr
	}

	return ip
}
