package middleware

import (
	"bytes"
	"log"
	"net/http"
	"net/http/httptest"
	"net/url"
	"strings"
	"testing"
)

func TestAccessLog(t *testing.T) {
	var recorder bytes.Buffer
	logger := log.New(&recorder, "", 0)

	cases := []struct {
		req  *http.Request
		base http.Handler
		want string
	}{
		{
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.1",
				Method:     http.MethodGet,
				URL: &url.URL{
					Scheme: "http",
					Host:   "127.0.0.1:3000",
					Path:   "/foobar",
				},
			},
			base: http.NotFoundHandler(),
			want: "HTTP/1.1 404 GET http://127.0.0.1:3000/foobar from 192.168.11.1",
		},
		{
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.1",
				Method:     http.MethodGet,
				URL: &url.URL{
					Scheme: "http",
					Host:   "127.0.0.1:3000",
					Path:   "/foobar",
				},
				Header: http.Header{
					"X-Forwarded-For": []string{"192.168.11.2", "192.168.11.3"},
				},
			},
			base: http.NotFoundHandler(),
			want: "HTTP/1.1 404 GET http://127.0.0.1:3000/foobar from 192.168.11.1 forwarded for [192.168.11.2 192.168.11.3]",
		},
	}

	for n, c := range cases {
		recorder.Reset()
		AccessLog(c.base, logger).ServeHTTP(httptest.NewRecorder(), c.req)

		if got := strings.TrimSpace(recorder.String()); got != c.want {
			t.Errorf("%d: want=%s got=%s", n, c.want, got)
		}
	}
}
