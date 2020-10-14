package config

import (
	"time"
)

const (
	defaultTimeout        = 3 * time.Second
	defaultRetry          = 3
	defaultProtocol       = "tcp"
	defaultBindingAddress = "0.0.0.0"
	defaultPort           = 3000
)

// Option is
type Option struct {
	Timeout        time.Duration
	Retry          int
	Protocol       string
	BindingAddress string
	Port           int
}

// NewOption is
func NewOption() *Option {
	return &Option{
		Timeout:        defaultTimeout,
		Retry:          defaultRetry,
		Protocol:       defaultProtocol,
		BindingAddress: defaultBindingAddress,
		Port:           defaultPort,
	}
}
