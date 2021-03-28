package server

import (
	"fmt"
	"net/http"

	"github.com/supercaracal/aniwatch/internal/config"
	"github.com/supercaracal/aniwatch/internal/data"
	"github.com/supercaracal/aniwatch/internal/lineup"
	"github.com/supercaracal/aniwatch/internal/middleware"
)

// MakeServeMux is
func MakeServeMux(logger *config.Logger, dat *data.Data, rootDir, contentDir string) (http.Handler, error) {
	mux := http.NewServeMux()

	if err := setUpRoot(mux, logger, dat, rootDir); err != nil {
		return nil, err
	}

	setUpStaticContents(mux, dat, contentDir)

	var h http.Handler = mux
	h = middleware.AccessLog(h, logger.Info)

	return h, nil
}

func setUpRoot(mux *http.ServeMux, logger *config.Logger, dat *data.Data, rootDir string) error {
	ctrl, err := lineup.NewController(dat, logger, rootDir)
	if err != nil {
		return err
	}

	mux.HandleFunc("/", ctrl.Exec)

	return nil
}

func setUpStaticContents(mux *http.ServeMux, dat *data.Data, contentDir string) {
	files := []string{"favicon.ico", "style.css"}

	for _, f := range files {
		mux.HandleFunc(
			fmt.Sprintf("/%s/%s", dat.AppName, f),
			func(w http.ResponseWriter, r *http.Request) {
				http.ServeFile(w, r, fmt.Sprintf("%s/%s", contentDir, f))
			},
		)
	}
}
