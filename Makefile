SHELL    := /bin/bash
BIN_NAME := server

all: build test lint

build: ${BIN_NAME}

${BIN_NAME}: main.go
	go build -ldflags="-s -w" -trimpath -o $@

test:
	go test

lint:
	go vet
	golint -set_exit_status

clean:
	@rm -f ${BIN_NAME} main

.PHONY: all build test lint clean
