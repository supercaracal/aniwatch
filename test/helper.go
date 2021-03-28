package test

import (
	"os"
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
