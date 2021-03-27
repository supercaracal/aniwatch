package main

import (
	"flag"
	"fmt"
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

func serve(app *server.AppServer, logger *config.Logger) error {
	go func(app *server.AppServer, logger *config.Logger) {
		logger.Info.Println("Starting up the server")
		if err := app.Start(); err != nil {
			logger.Err.Print(err)
		}
	}(app, logger)

	app.Wait()

	logger.Info.Println("Shutting down the server")
	if err := app.Stop(); err != nil {
		return err
	}

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
		buf, err := lineup.GetIndexHTML(dat)
		if err != nil {
			logger.Err.Fatal(err)
		}
		fmt.Print(buf.String())
		os.Exit(0)
	}

	mux, err := server.NewServeMux(logger, dat, contentDir)
	if err != nil {
		logger.Err.Fatal(err)
	}

	app, err := server.NewAppServer(
		option.Timeout,
		option.Protocol,
		option.BindingAddress,
		option.Port,
		mux,
	)
	if err != nil {
		logger.Err.Fatal(err)
	}

	if err := serve(app, logger); err != nil {
		logger.Err.Fatal(err)
	}

	os.Exit(0)
}
