package routing

import (
	"fmt"
	"net/http"

	"github.com/supercaracal/aniwatch/internal/config"
	"github.com/supercaracal/aniwatch/internal/data"
	"github.com/supercaracal/aniwatch/internal/lineup"
)

// SetUp is
func SetUp(logger *config.Logger, dat *data.Data, contentDir string) error {
	err := setUpRoot(logger, dat)
	if err != nil {
		return err
	}

	setUpStaticContents(dat, contentDir)
	return nil
}

func setUpRoot(logger *config.Logger, dat *data.Data) error {
	lineupResource, err := lineup.NewController(dat, logger)
	if err != nil {
		return err
	}

	http.HandleFunc("/", lineupResource.Index)
	return nil
}

func setUpStaticContents(dat *data.Data, contentDir string) {
	files := []string{"favicon.ico", "style.css"}
	for _, f := range files {
		http.HandleFunc(
			fmt.Sprintf("/%s/%s", dat.AppName, f),
			func(w http.ResponseWriter, r *http.Request) {
				http.ServeFile(w, r, fmt.Sprintf("%s/%s", contentDir, f))
			},
		)
	}
}
