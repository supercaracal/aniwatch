package test

import (
	"io"
	"log"
	"os"

	"github.com/supercaracal/aniwatch/internal/config"
)

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
