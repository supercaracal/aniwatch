SHELL := /bin/bash

all: build test lint

build: server

server: main.go
	go build -ldflags="-s -w" -trimpath -o $@

test:
	go test

lint:
	go vet
	golint -set_exit_status

clean:
	@rm -f server main

.PHONY: all build test lint clean
