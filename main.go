package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"

	"github.com/supercaracal/aniwatch/internal/config"
	"github.com/supercaracal/aniwatch/internal/data"
	"github.com/supercaracal/aniwatch/internal/lineup"
	"github.com/supercaracal/aniwatch/internal/routing"
	"github.com/supercaracal/aniwatch/internal/server"
)

const (
	contentDir   = "docs"
	dataFilePath = "config/data.yaml"
)

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

func printLineupContent(dat *data.Data) error {
	var buf bytes.Buffer

	err := lineup.Print(dat, &buf)
	if err != nil {
		return err
	}

	fmt.Print(buf.String())
	return nil
}

func main() {
	logger := config.NewLogger()
	option := config.NewOption()

	flag.IntVar(&option.Port, "port", option.Port, "listen port number")
	flag.BoolVar(&option.Print, "print", option.Print, "print mode")
	flag.Parse()

	dat, err := data.Load(dataFilePath)
	if err != nil {
		logger.Err.Fatal(err)
	}

	if option.Print {
		err := printLineupContent(dat)
		if err != nil {
			logger.Err.Fatal(err)
		}
		os.Exit(0)
	}

	err = routing.SetUp(logger, dat, contentDir)
	if err != nil {
		logger.Err.Fatal(err)
	}

	err = serve(option, logger)
	if err != nil {
		logger.Err.Fatal(err)
	}

	os.Exit(0)
}
