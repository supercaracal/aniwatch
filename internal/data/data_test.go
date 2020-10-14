package data

import (
	"testing"
	"time"
)

const (
	dataFilePath = "../../config/data.yaml"
)

func TestGetSlot(t *testing.T) {
	cases := []struct {
		timeStr  string
		expected string
	}{
		{"2020-01-01T00:00:00Z", "midnight"},
		{"2020-01-01T04:59:59Z", "midnight"},
		{"2020-01-01T05:00:00Z", "daytime"},
		{"2020-01-01T15:59:59Z", "daytime"},
		{"2020-01-01T16:00:00Z", "sunset"},
		{"2020-01-01T18:59:59Z", "sunset"},
		{"2020-01-01T19:00:00Z", "night"},
		{"2020-01-01T23:59:59Z", "night"},
	}
	dt, err := Load(dataFilePath)
	if err != nil {
		t.Fatal(err)
	}

	for _, c := range cases {
		argTime, err := time.Parse(time.RFC3339, c.timeStr)
		if err != nil {
			t.Fatal(err)
		}
		actual := dt.GetSlot(argTime)
		if c.expected != actual {
			t.Errorf("expected=%s, actual=%s", c.expected, actual)
		}
	}
}
