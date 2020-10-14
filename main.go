package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/supercaracal/aniwatch/internal/config"
	"github.com/supercaracal/aniwatch/internal/data"
	"github.com/supercaracal/aniwatch/internal/lineup"
	"github.com/supercaracal/aniwatch/internal/server"
)

const (
	contentDir   = "docs"
	dataFilePath = "config/data.yaml"
)

func setUpRouting(logger *config.Logger) error {
	dt, err := data.Load(dataFilePath)
	if err != nil {
		return err
	}

	lineupResource, err := lineup.NewController(dt, logger)
	if err != nil {
		return err
	}
	http.HandleFunc("/", lineupResource.Index)

	files := []string{"favicon.ico", "style.css"}
	for _, f := range files {
		http.HandleFunc(
			fmt.Sprintf("/%s/%s", dt.AppName, f),
			func(w http.ResponseWriter, r *http.Request) {
				http.ServeFile(w, r, fmt.Sprintf("%s/%s", contentDir, f))
			},
		)
	}

	return nil
}

func serve(option *config.Option, logger *config.Logger) error {
	app, err := server.NewAppServer(option.Timeout, option.Protocol, option.BindingAddress, option.Port)
	if err != nil {
		return err
	}

	go func(s *server.AppServer, l *config.Logger) {
		l.Info.Println("Starting up the server")
		err := s.Start()
		if err != nil {
			l.Err.Fatal(err)
		}
	}(app, logger)

	app.Wait()
	logger.Info.Println("Shutting down the server")
	err = app.Stop()
	if err != nil {
		return err
	}

	return nil
}

func main() {
	logger := config.NewLogger()
	option := config.NewOption()

	err := setUpRouting(logger)
	if err != nil {
		logger.Err.Fatal(err)
	}

	err = serve(option, logger)
	if err != nil {
		logger.Err.Fatal(err)
	}

	os.Exit(0)
}
