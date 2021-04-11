SHELL    := /bin/bash
BIN_NAME := server

all: build test lint

build:
	@go build -ldflags="-s -w" -trimpath -tags timetzdata -o ${BIN_NAME}

test:
	@go clean -testcache
	@go test ./...

bench:
	@go test -bench=. -benchmem -run=NONE ./...

lint:
	@go vet ./...
	@golint -set_exit_status ./...

clean:
	@rm -f ${BIN_NAME} main

print: clean build
	@./${BIN_NAME} -print > docs/index.html

.PHONY: all build test lint clean print
