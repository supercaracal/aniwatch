package server

import (
	"context"
	"fmt"
	"io/ioutil"
	"net/http"
	"sync"
	"syscall"
	"testing"
	"time"

	"github.com/supercaracal/aniwatch/test"
)

const (
	timeout            = 700 * time.Millisecond
	responseDelay      = 300 * time.Millisecond
	timelimit          = 1000 * time.Millisecond
	testServerProto    = "tcp"
	testServerBindAddr = "0.0.0.0"
	testHost           = "127.0.0.1"
	testURLPath        = "/test"
	testResBody        = "done"
	contentTypeHeader  = "Content-Type"
	contentType        = "text/plain;charset=UTF-8"
	testURLFmt         = "http://%s:%d%s"
)

func TestServe(t *testing.T) {
	readyToServe := make(chan struct{})
	readyToRespond := make(chan struct{})
	done := make(chan struct{})
	var wg sync.WaitGroup

	// zero port means a ephemeral port selected by the system
	app, err := NewAppServer(timeout, testServerProto, testServerBindAddr, 0)
	if err != nil {
		t.Fatal(err)
	}
	app.WithServeMux(makeTestMux(t, readyToRespond))
	app.WithReadinessNotification(readyToServe)

	go func(done <-chan struct{}) {
		ctx, cancel := context.WithTimeout(context.Background(), timelimit)
		defer cancel()

		select {
		case <-ctx.Done():
			// trigger deadman switch
			t.Error(ctx.Err())
			close(readyToServe)
			close(readyToRespond)
			app.Die()
		case <-done:
			return
		}
	}(done)

	wg.Add(1)
	go func() {
		defer wg.Done()
		if err := app.Serve(); err != nil {
			t.Error(err)
		}
	}()
	<-readyToServe

	wg.Add(1)
	go func() {
		defer wg.Done()
		if err := sendTestRequest(t, app.GetPort()); err != nil {
			t.Error(err)
		}
	}()
	<-readyToRespond

	test.SignalOneself(syscall.SIGTERM)
	wg.Wait()
	done <- struct{}{}
}

func makeTestMux(t *testing.T, cn chan<- struct{}) http.Handler {
	t.Helper()

	mux := http.NewServeMux()
	mux.HandleFunc(testURLPath, func(w http.ResponseWriter, r *http.Request) {
		cn <- struct{}{}
		w.Header().Set(contentTypeHeader, contentType)
		time.Sleep(responseDelay)
		if size, err := w.Write([]byte(testResBody)); err != nil || size != len(testResBody) {
			w.WriteHeader(http.StatusInternalServerError)
		}
	})

	return mux
}

func sendTestRequest(t *testing.T, port int) error {
	t.Helper()

	url := fmt.Sprintf(testURLFmt, testHost, port, testURLPath)
	req, err := http.NewRequest(http.MethodGet, url, nil)
	if err != nil {
		return err
	}

	hc := &http.Client{Timeout: timeout}
	resp, err := hc.Do(req)
	if err != nil {
		return err
	}

	if resp.StatusCode != http.StatusOK {
		return err
	}

	bytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	if string(bytes) != testResBody {
		return fmt.Errorf("unexpected body")
	}

	return nil
}
