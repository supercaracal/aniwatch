package middleware

import (
	"bytes"
	"encoding/json"
	"log"
	"net/http"
	"net/http/httptest"
	"net/url"
	"reflect"
	"testing"

	"github.com/supercaracal/aniwatch/test"
)

func TestAccessLog(t *testing.T) {
	var recorder bytes.Buffer
	logger := log.New(&recorder, "", 0)

	cases := []struct {
		req  *http.Request
		base http.Handler
		want *AccessLogFmt
	}{
		{
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.1",
				Method:     http.MethodGet,
				Host:       "127.0.0.1:3000",
				URL: &url.URL{
					Path: "/foobar",
				},
			},
			base: http.NotFoundHandler(),
			want: &AccessLogFmt{
				HTTPRequestMethod:      http.MethodGet,
				HTTPResponseStatusCode: http.StatusNotFound,
				HTTPResponseBodyBytes:  19,
				HTTPVersion:            "HTTP/1.1",
				HostIP:                 "127.0.0.1",
				URLOriginal:            "/foobar",
				SourceIP:               "192.168.11.1",
			},
		},
		{
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.1",
				Method:     http.MethodGet,
				Host:       "127.0.0.1:3000",
				URL: &url.URL{
					Path: "/foobar",
				},
				Header: http.Header{
					"X-Forwarded-For": []string{"192.168.11.2", "192.168.11.3"},
					"User-Agent":      []string{"test-user-bot"},
				},
			},
			base: http.NotFoundHandler(),
			want: &AccessLogFmt{
				UserAgent:              "test-user-bot",
				HTTPRequestMethod:      http.MethodGet,
				HTTPRequestHeaderXFF:   []string{"192.168.11.2", "192.168.11.3"},
				HTTPResponseStatusCode: http.StatusNotFound,
				HTTPResponseBodyBytes:  19,
				HTTPVersion:            "HTTP/1.1",
				HostIP:                 "127.0.0.1",
				URLOriginal:            "/foobar",
				SourceIP:               "192.168.11.1",
			},
		},
	}

	for n, c := range cases {
		recorder.Reset()
		AccessLog(c.base, logger).ServeHTTP(httptest.NewRecorder(), c.req)

		var got AccessLogFmt
		if err := json.Unmarshal(recorder.Bytes(), &got); err != nil {
			t.Error(err)
			continue
		}

		got.Timestamp = ""     // skip
		got.ProcessingTime = 0 // skip
		if !reflect.DeepEqual(&got, c.want) {
			t.Errorf("%d: want=%+v got=%+v", n, c.want, got)
		}
	}
}

func BenchmarkAccessLog(b *testing.B) {
	h := AccessLog(http.NotFoundHandler(), test.NewFakeLogger().Info)
	w := test.NewNullResponseWriter()
	r := &http.Request{
		RemoteAddr: "192.168.11.1",
		Proto:      "HTTP/1.1",
		Method:     http.MethodGet,
		Host:       "127.0.0.1:3000",
		URL: &url.URL{
			Path: "/foobar",
		},
		Header: http.Header{
			"X-Forwarded-For": []string{"192.168.11.2", "192.168.11.3"},
			"User-Agent":      []string{"test-user-bot"},
		},
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		h.ServeHTTP(w, r)
	}
}
