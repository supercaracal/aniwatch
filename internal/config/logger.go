package config

import (
	"log"
	"os"
)

// Logger is
type Logger struct {
	Info *log.Logger
	Err  *log.Logger
}

// NewLogger is
func NewLogger() *Logger {
	return &Logger{
		Info: log.New(os.Stdout, "[INFO] ", log.LstdFlags),
		Err:  log.New(os.Stderr, "[ERROR] ", log.LstdFlags),
	}
}
