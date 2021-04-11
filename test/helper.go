package test

import (
	"io"
	"log"
	"net/http"
	"os"

	"github.com/supercaracal/aniwatch/internal/config"
)

// NullResponseWriter is
type NullResponseWriter struct {
	h  http.Header
	b  io.Writer
	sc int
}

// NewNullResponseWriter is
func NewNullResponseWriter() *NullResponseWriter {
	return &NullResponseWriter{h: http.Header{}, b: io.Discard}
}

// Header is
func (w *NullResponseWriter) Header() http.Header {
	return w.h
}

// Write is
func (w *NullResponseWriter) Write(p []byte) (int, error) {
	return w.b.Write(p)
}

// WriteHeader is
func (w *NullResponseWriter) WriteHeader(statusCode int) {
	w.sc = statusCode
}

// SignalOneself is
func SignalOneself(s os.Signal) error {
	proc, err := os.FindProcess(os.Getpid())
	if err != nil {
		return err
	}

	err = proc.Signal(s)
	if err != nil {
		return err
	}

	return nil
}

// NewFakeLogger is
func NewFakeLogger() *config.Logger {
	return &config.Logger{
		Info: log.New(io.Discard, "", 0),
		Err:  log.New(io.Discard, "", 0),
	}
}
