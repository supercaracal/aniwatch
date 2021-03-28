package server

import (
	"context"
	"fmt"
	"net"
	"net/http"
	"os"
	"os/signal"
	"sync"
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

	var (
		wg             sync.WaitGroup
		upErr, downErr error
	)

	wg.Add(1)
	go func(c chan<- os.Signal) {
		defer wg.Done()
		upErr = app.server.Serve(app.listener)
		if upErr == nil || upErr == http.ErrServerClosed {
			upErr = nil
			return
		}
		c <- syscall.SIGTERM
	}(c)

	wg.Add(1)
	go func(c <-chan os.Signal) {
		defer wg.Done()
		<-c
		app.server.SetKeepAlivesEnabled(false)
		ctx, cancel := context.WithTimeout(context.Background(), shutdownTimeout)
		defer cancel()
		downErr = app.server.Shutdown(ctx)
	}(c)

	wg.Wait()

	if upErr != nil {
		return upErr
	}

	if downErr != nil {
		return downErr
	}

	return nil
}
