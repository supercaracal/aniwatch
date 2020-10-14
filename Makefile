SHELL    := /bin/bash
BIN_NAME := aniwatch

all: build test lint

build:
	go build -ldflags="-s -w" -trimpath -tags timetzdata -o ${BIN_NAME}

test:
	go test ./...

lint:
	go vet ./...
	golint -set_exit_status ./...

clean:
	@rm -f ${BIN_NAME} main

.PHONY: all build test lint clean
