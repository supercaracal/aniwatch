package lineup

import (
	"net/http"
	"net/url"
	"testing"

	"github.com/supercaracal/aniwatch/internal/data"
	"github.com/supercaracal/aniwatch/test"
)

func BenchmarkIndex(b *testing.B) {
	dat, err := data.Load()
	if err != nil {
		b.Fatal(err)
	}

	ctrl, err := NewController(dat, test.NewFakeLogger())
	if err != nil {
		b.Fatal(err)
	}

	w := test.NewNullResponseWriter()
	r := &http.Request{
		RemoteAddr: "192.168.11.1",
		Proto:      "HTTP/1.1",
		Method:     http.MethodGet,
		URL: &url.URL{
			Scheme: "http",
			Host:   "127.0.0.1:3000",
			Path:   "/",
		},
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ctrl.index(w, r)
	}
}
