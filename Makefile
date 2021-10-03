MAKEFLAGS += --warn-undefined-variables
SHELL     := /bin/bash -euo pipefail
APP_NAME  := server
GOBIN     ?= $(shell go env GOPATH)/bin

all: build test lint

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

prof:
ifndef PKG 
	@echo 'missing environment variables: PKG'
	@exit 1
else
	@if [ ! -d "./internal/${PKG}" ]; then\
		echo 'not found: PKG';\
		exit 1;\
	fi

	@for t in cpu block mem; do\
		go test -bench=. -run=NONE -$${t}profile=$${t}.out ./internal/${PKG};\
		go tool pprof -text -nodecount=10 ./${PKG}.test $${t}.out;\
	done
endif

${GOBIN}/golint:
	go install golang.org/x/lint/golint@latest

lint: ${GOBIN}/golint
	@go vet ./...
	@golint -set_exit_status ./...

clean:
	@rm -f ${APP_NAME} main *.test *.out

print: clean build
	@./${APP_NAME} -print > docs/index.html
