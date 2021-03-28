package server

import (
	"context"
	"fmt"
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

const (
	maxHeaderBytes  = 1 << 20
	shutdownTimeout = 5 * time.Second
)

// AppServer is
type AppServer struct {
	server   *http.Server
	listener *net.TCPListener
}

// NewAppServer is
func NewAppServer(timeout time.Duration, proto string, addr string, port int, mux http.Handler) (*AppServer, error) {
	tcpAddr, err := net.ResolveTCPAddr(proto, fmt.Sprintf("%s:%d", addr, port))
	if err != nil {
		return nil, fmt.Errorf("Failed to resolve addr: %w", err)
	}

	listener, err := net.ListenTCP(proto, tcpAddr)
	if err != nil {
		return nil, fmt.Errorf("Failed to listen port: %w", err)
	}

	httpServer := &http.Server{
		ReadTimeout:    timeout,
		WriteTimeout:   timeout,
		MaxHeaderBytes: maxHeaderBytes,
		Handler:        mux,
	}

	return &AppServer{
		server:   httpServer,
		listener: listener,
	}, nil
}

// Serve is
func (app *AppServer) Serve() error {
	defer app.listener.Close()

	c := make(chan os.Signal, 1)
	defer close(c)

	signal.Notify(c, syscall.SIGTERM, syscall.SIGINT, os.Interrupt)
	defer signal.Stop(c)

	go func(c <-chan os.Signal) {
		<-c
		app.server.SetKeepAlivesEnabled(false)
		ctx, cancel := context.WithTimeout(context.Background(), shutdownTimeout)
		defer cancel()
		app.server.Shutdown(ctx)
	}(c)

	if err := app.server.Serve(app.listener); err != nil && err != http.ErrServerClosed {
		return err
	}

	return nil
}
