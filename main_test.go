package main

import (
	"io/ioutil"
	"log"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"
)

func TestCamelize(t *testing.T) {
	type TestCase struct {
		v        string
		expected string
	}
	cases := []TestCase{
		TestCase{"art", "Art"},
		TestCase{"hey", "Hey"},
		TestCase{"zoo", "Zoo"},
		TestCase{"", ""},
		TestCase{"123", "123"},
		TestCase{"AAA", "AAA"},
		TestCase{"a", "A"},
	}
	for _, c := range cases {
		actual := camelize(c.v)
		if c.expected != actual {
			t.Errorf("expected=%s, actual=%s", c.expected, actual)
		}
	}
}

func TestCalcQuarter(t *testing.T) {
	type TestCase struct {
		timeStr  string
		expected int
	}
	cases := []TestCase{
		TestCase{"2020-01-01T00:00:00Z", 1},
		TestCase{"2020-03-31T23:59:59Z", 1},
		TestCase{"2020-04-01T00:00:00Z", 2},
		TestCase{"2020-06-30T23:59:59Z", 2},
		TestCase{"2020-07-01T00:00:00Z", 3},
		TestCase{"2020-09-30T23:59:59Z", 3},
		TestCase{"2020-10-01T00:00:00Z", 4},
		TestCase{"2020-12-31T23:59:59Z", 4},
	}
	for _, c := range cases {
		argTime, err := time.Parse(time.RFC3339, c.timeStr)
		if err != nil {
			t.Fatal(err)
		}
		actual := calcQuarter(argTime)
		if c.expected != actual {
			t.Errorf("expected=%d, actual=%d", c.expected, actual)
		}
	}
}

func TestTimeToSlot(t *testing.T) {
	type TestCase struct {
		timeStr  string
		expected string
	}
	cases := []TestCase{
		TestCase{"2020-01-01T00:00:00Z", "midnight"},
		TestCase{"2020-01-01T04:59:59Z", "midnight"},
		TestCase{"2020-01-01T05:00:00Z", "daytime"},
		TestCase{"2020-01-01T15:59:59Z", "daytime"},
		TestCase{"2020-01-01T16:00:00Z", "sunset"},
		TestCase{"2020-01-01T18:59:59Z", "sunset"},
		TestCase{"2020-01-01T19:00:00Z", "night"},
		TestCase{"2020-01-01T23:59:59Z", "night"},
	}
	for _, c := range cases {
		argTime, err := time.Parse(time.RFC3339, c.timeStr)
		if err != nil {
			t.Fatal(err)
		}
		actual := timeToSlot(argTime)
		if c.expected != actual {
			t.Errorf("expected=%s, actual=%s", c.expected, actual)
		}
	}
}

func TestServerFeatures(t *testing.T) {
	err := initialize()
	if err != nil {
		t.Fatal(err)
	}

	logger = myLogger{
		info: log.New(ioutil.Discard, "", log.LstdFlags),
		err:  log.New(ioutil.Discard, "", log.LstdFlags),
	}

	setUpRESTRouting()
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
