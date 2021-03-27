package lineup

import (
	"testing"
	"time"
)

func TestCamelize(t *testing.T) {
	cases := []struct {
		v    string
		want string
	}{
		{"art", "Art"},
		{"hey", "Hey"},
		{"zoo", "Zoo"},
		{"", ""},
		{"123", "123"},
		{"AAA", "AAA"},
		{"a", "A"},
	}

	for n, c := range cases {
		if got := camelize(c.v); c.want != got {
			t.Errorf("%d: want=%s, got=%s", n+1, c.want, got)
		}
	}
}

func TestCalcQuarter(t *testing.T) {
	cases := []struct {
		timeStr string
		want    int
	}{
		{"2020-01-01T00:00:00Z", 1},
		{"2020-03-31T23:59:59Z", 1},
		{"2020-04-01T00:00:00Z", 2},
		{"2020-06-30T23:59:59Z", 2},
		{"2020-07-01T00:00:00Z", 3},
		{"2020-09-30T23:59:59Z", 3},
		{"2020-10-01T00:00:00Z", 4},
		{"2020-12-31T23:59:59Z", 4},
	}

	for n, c := range cases {
		argTime, err := time.Parse(time.RFC3339, c.timeStr)
		if err != nil {
			t.Fatal(err)
		}

		if got := calcQuarter(argTime); c.want != got {
			t.Errorf("%d: want=%d, got=%d", n+1, c.want, got)
		}
	}
}
