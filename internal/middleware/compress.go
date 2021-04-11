package middleware

// @see https://gist.github.com/CJEnright/bc2d8b8dc0c1389a9feeddb110f822d7

import (
	"compress/gzip"
	"io"
	"net/http"
	"strings"
	"sync"
)

const (
	headerKeyAcceptEncoding  = "Accept-Encoding"
	headerKeyContentEncoding = "Content-Encoding"
	headerKeyContentLength   = "Content-Length"
	headerValGzip            = "gzip"
)

var gzWriterPool = sync.Pool{
	New: func() interface{} {
		return gzip.NewWriter(io.Discard)
	},
}

type compressibleResponseWriter struct {
	orig   http.ResponseWriter
	writer io.Writer
}

func (w *compressibleResponseWriter) Header() http.Header {
	return w.orig.Header()
}

func (w *compressibleResponseWriter) WriteHeader(status int) {
	w.orig.Header().Del(headerKeyContentLength)
	w.orig.WriteHeader(status)
}

func (w *compressibleResponseWriter) Write(b []byte) (int, error) {
	return w.writer.Write(b)
}

// CompressResponse is
func CompressResponse(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if !strings.Contains(r.Header.Get(headerKeyAcceptEncoding), headerValGzip) ||
			w.Header().Get(headerKeyContentEncoding) == headerValGzip {

			next.ServeHTTP(w, r)
			return
		}

		writer := gzWriterPool.Get().(*gzip.Writer)
		defer gzWriterPool.Put(writer)

		writer.Reset(w)
		defer writer.Close()

		w.Header().Set(headerKeyContentEncoding, headerValGzip)
		next.ServeHTTP(&compressibleResponseWriter{orig: w, writer: writer}, r)
	})
}
