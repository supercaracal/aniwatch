SHELL    := /bin/bash
BIN_NAME := server

all: build test lint

build:
	@go build -ldflags="-s -w" -trimpath -tags timetzdata -o ${BIN_NAME}

test:
	@go clean -testcache
	@go test ./...

lint:
	@go vet ./...
	@golint -set_exit_status ./...

print:
	@./${BIN_NAME} -print > docs/index.html

clean:
	@rm -f ${BIN_NAME} main

.PHONY: all build test lint print clean
