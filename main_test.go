package main

import (
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"

	"github.com/supercaracal/aniwatch/internal/config"
)

func TestServerFeatures(t *testing.T) {
	logger := config.NewFakeLogger()
	err := setUpRouting(logger)
	if err != nil {
		t.Fatal(err)
	}

	ts := httptest.NewServer(http.DefaultServeMux)
	defer ts.Close()

	hc := &http.Client{Timeout: 3 * time.Second}

	req, err := http.NewRequest("GET", ts.URL, nil)
	if err != nil {
		t.Fatal(err)
	}

	resp, err := hc.Do(req)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	bytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		t.Fatal(err)
	}
	body := string(bytes)

	if resp.StatusCode != http.StatusOK {
		t.Errorf("expected=%d, actual=%d", http.StatusOK, resp.StatusCode)
	}

	if !strings.Contains(body, "</body>") {
		t.Errorf("'%s' is not found in\n```\n%s```\n", "</body>", body)
	}
}
