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
func NewAppServer(
	timeout time.Duration,
	proto string,
	addr string,
	port int,
) (*AppServer, error) {

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
	}

	return &AppServer{
		server:   httpServer,
		listener: listener,
	}, nil
}

// Start is
func (app *AppServer) Start() error {
	defer app.listener.Close()
	return app.server.Serve(app.listener)
}

// Wait is
func (app *AppServer) Wait() {
	c := make(chan os.Signal, 1)
	signal.Notify(c, syscall.SIGTERM, os.Interrupt)
	<-c
}

// Stop is
func (app *AppServer) Stop() error {
	ctx, cancel := context.WithTimeout(context.Background(), shutdownTimeout)
	defer cancel()
	return app.server.Shutdown(ctx)
}
