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

	mux, err := server.MakeServeMux(logger, dat, contentDir)
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

	logger.Info.Println("Hello")
	if err := app.Serve(); err != nil {
		logger.Err.Fatal(err)
	}
	logger.Info.Println("Bye Bye")

	os.Exit(0)
}
