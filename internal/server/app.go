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
	connIdleTimeout = 61 * time.Second
)

// AppServer is
type AppServer struct {
	server   *http.Server
	listener *net.TCPListener
	port     int
	ready    chan<- struct{}
}

// NewAppServer is
func NewAppServer(timeout time.Duration, proto string, addr string, port int) (*AppServer, error) {
	tcpAddr, err := net.ResolveTCPAddr(proto, fmt.Sprintf("%s:%d", addr, port))
	if err != nil {
		return nil, fmt.Errorf("failed to resolve addr: %w", err)
	}

	listener, err := net.ListenTCP(proto, tcpAddr)
	if err != nil {
		return nil, fmt.Errorf("failed to listen port: %w", err)
	}

	httpServer := &http.Server{
		ReadTimeout:    timeout,
		WriteTimeout:   timeout,
		IdleTimeout:    connIdleTimeout,
		MaxHeaderBytes: maxHeaderBytes,
	}

	return &AppServer{
		server:   httpServer,
		listener: listener,
		port:     fixPort(listener, port),
	}, nil
}

// WithServeMux is
func (app *AppServer) WithServeMux(mux http.Handler) {
	app.server.Handler = mux
}

// WithReadinessNotification is
func (app *AppServer) WithReadinessNotification(c chan<- struct{}) {
	app.ready = c
}

// Serve is
func (app *AppServer) Serve() error {
	defer app.listener.Close()

	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM)
	defer stop()

	go func(ctx context.Context) {
		<-ctx.Done()
		app.server.SetKeepAlivesEnabled(false)
		ctx, cancel := context.WithTimeout(context.Background(), shutdownTimeout)
		defer cancel()
		_ = app.server.Shutdown(ctx)
	}(ctx)

	if app.ready != nil {
		app.ready <- struct{}{}
	}

	if err := app.server.Serve(app.listener); err != nil && err != http.ErrServerClosed {
		return err
	}

	return nil
}

// Die is
func (app *AppServer) Die() error {
	return app.server.Close()
}

// GetPort is
func (app *AppServer) GetPort() int {
	return app.port
}

func fixPort(listener net.Listener, port int) int {
	switch addr := listener.Addr().(type) {
	case *net.TCPAddr:
		return addr.Port
	case *net.UDPAddr:
		return addr.Port
	default:
		return port
	}
}
