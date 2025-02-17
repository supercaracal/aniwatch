MAKEFLAGS += --warn-undefined-variables
SHELL     := /bin/bash -euo pipefail
APP_NAME  := server
GOBIN     ?= $(shell go env GOPATH)/bin

all: build test lint print

build: GOOS        ?= $(shell go env GOOS)
build: GOARCH      ?= $(shell go env GOARCH)
build: CGO_ENABLED ?= $(shell go env CGO_ENABLED)
build: FLAGS       += -ldflags="-s -w"
build: FLAGS       += -trimpath
build: FLAGS       += -tags timetzdata
build:
	GOOS=${GOOS} GOARCH=${GOARCH} CGO_ENABLED=${CGO_ENABLED} go build ${FLAGS} -o ${APP_NAME}

.PHONY: test
test:
	@go clean -testcache
	@go test -race ./...

bench:
	@go test -bench=. -benchmem -run=NONE ./...

prof: PKG ?= middleware
prof: TYPE ?= mem
prof:
	@if [[ -z "${PKG}" ]]; then echo 'empty variable: PKG'; exit 1; fi
	@if [[ -z "${TYPE}" ]]; then echo 'empty variable: TYPE'; exit 1; fi
	@if [[ ! -d "./internal/${PKG}" ]]; then echo 'package not found: ${PKG}'; exit 1; fi
	@go test -bench=. -run=NONE -${TYPE}profile=${TYPE}.out ./internal/${PKG}
	@go tool pprof -text -nodecount=10 ./${PKG}.test ${TYPE}.out

lint:
	@go vet ./...

clean:
	@rm -f ${APP_NAME} main *.test *.out

print:
	@./${APP_NAME} -print > docs/index.html
