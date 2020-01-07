SHELL := /bin/bash

all:
	@$(MAKE) --no-print-directory build
	@$(MAKE) --no-print-directory test
	@$(MAKE) --no-print-directory lint

build:
	@$(MAKE) --no-print-directory server

server: main.go
	go build -ldflags="-s -w" -trimpath -o $@

test:
	go test

lint:
	go vet
	$$GOPATH/bin/golint -set_exit_status

clean:
	@rm -f server main

.PHONY: all build test lint clean
