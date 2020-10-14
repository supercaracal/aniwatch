package config

import (
	"io/ioutil"
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

// NewFakeLogger is
func NewFakeLogger() *Logger {
	return &Logger{
		Info: log.New(ioutil.Discard, "", log.LstdFlags),
		Err:  log.New(ioutil.Discard, "", log.LstdFlags),
	}
}
