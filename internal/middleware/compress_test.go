package middleware

import (
	"compress/gzip"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"net/url"
	"testing"

	"github.com/supercaracal/aniwatch/test"
)

func TestCompressResponse(t *testing.T) {
	cases := []struct {
		desc            string
		req             *http.Request
		base            http.Handler
		want            []byte
		contentEncoding string
	}{
		{
			desc: "don't compress if Accept-Encoding header don't include gzip",
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.0",
				Method:     http.MethodGet,
				Host:       "127.0.0.1:3000",
				URL: &url.URL{
					Path: "/foobar",
				},
			},
			base:            http.NotFoundHandler(),
			want:            []byte("404 page not found\n"),
			contentEncoding: "",
		},
		{
			desc: "can compress if Accept-Encoding header includes gzip",
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.0",
				Method:     http.MethodGet,
				Host:       "127.0.0.1:3000",
				URL: &url.URL{
					Path: "/foobar",
				},
				Header: http.Header{
					"Accept-Encoding": []string{"gzip", "deflate"},
				},
			},
			base:            http.NotFoundHandler(),
			want:            []byte("404 page not found\n"),
			contentEncoding: "gzip",
		},
		{
			desc: "can prevent double compression",
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.0",
				Method:     http.MethodGet,
				Host:       "127.0.0.1:3000",
				URL: &url.URL{
					Path: "/foobar",
				},
				Header: http.Header{
					"Accept-Encoding": []string{"gzip", "deflate"},
				},
			},
			base:            CompressResponse(http.NotFoundHandler()),
			want:            []byte("404 page not found\n"),
			contentEncoding: "gzip",
		},
		{
			desc: "can compress even if the body includes multi-byte strings",
			req: &http.Request{
				RemoteAddr: "192.168.11.1",
				Proto:      "HTTP/1.0",
				Method:     http.MethodGet,
				Host:       "127.0.0.1:3000",
				URL: &url.URL{
					Path: "/foobar",
				},
				Header: http.Header{
					"Accept-Encoding": []string{"gzip", "deflate"},
				},
			},
			base: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
				_, _ = w.Write([]byte("あいうえお"))
			}),
			want:            []byte("あいうえお"),
			contentEncoding: "gzip",
		},
	}

	for n, c := range cases {
		rec := httptest.NewRecorder()
		h := CompressResponse(c.base)
		h.ServeHTTP(rec, c.req)
		rec.Flush()

		res := rec.Result()
		defer res.Body.Close()

		if got := res.Header.Get("Content-Encoding"); got != c.contentEncoding {
			t.Errorf("%d: %s: want=%s, got=%s", n, c.desc, c.contentEncoding, got)
			continue
		}

		var reader io.ReadCloser
		if c.contentEncoding == "gzip" {
			var err error
			reader, err = gzip.NewReader(res.Body)
			if err != nil {
				t.Error(fmt.Errorf("%d: %s: %w", n, c.desc, err))
				continue
			}
			defer reader.Close()
		} else {
			reader = res.Body
		}

		got, err := io.ReadAll(reader)
		if err != nil {
			t.Error(fmt.Errorf("%d: %s: %w", n, c.desc, err))
			continue
		}

		if len(got) != len(c.want) {
			t.Errorf("%d: %s: want=%d, got=%d", n, c.desc, len(c.want), len(got))
			continue
		}

		for i, b := range c.want {
			if b != got[i] {
				t.Errorf("%d: %s: want=%b, got=%b", n, c.desc, b, got[i])
				break
			}
		}
	}
}

func BenchmarkCompressResponse(b *testing.B) {
	h := CompressResponse(http.NotFoundHandler())
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
			"Accept-Encoding": []string{"gzip", "deflate"},
		},
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		h.ServeHTTP(w, r)
	}
}
