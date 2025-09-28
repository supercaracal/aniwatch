MAKEFLAGS += --warn-undefined-variables
SHELL     := /bin/bash -euo pipefail

all: build test lint print

.PHONY: build
build: server

server: GOOS        ?= $(shell go env GOOS)
server: GOARCH      ?= $(shell go env GOARCH)
server: CGO_ENABLED ?= $(shell go env CGO_ENABLED)
server: FLAGS       += -ldflags="-s -w"
server: FLAGS       += -trimpath
server: FLAGS       += -tags timetzdata
server: $(shell find . -type f \( -name '*.go' -o -name 'go.*' -o -name '*.tpl' \))
	GOOS=${GOOS} GOARCH=${GOARCH} CGO_ENABLED=${CGO_ENABLED} go build ${FLAGS} -o $@

.PHONY: test
test:
	@go clean -testcache
	@go test -race ./...

.PHONY: bench
bench:
	@go test -bench=. -benchmem -run=NONE ./...

.PHONY: prof
prof: PKG  ?= middleware
prof: TYPE ?= mem
prof:
	@if [[ -z "${PKG}" ]]; then echo 'empty variable: PKG'; exit 1; fi
	@if [[ -z "${TYPE}" ]]; then echo 'empty variable: TYPE'; exit 1; fi
	@if [[ ! -d "./internal/${PKG}" ]]; then echo 'package not found: ${PKG}'; exit 1; fi
	@go test -bench=. -run=NONE -${TYPE}profile=${TYPE}.out ./internal/${PKG}
	@go tool pprof -text -nodecount=10 ./${PKG}.test ${TYPE}.out

.PHONY: lint
lint:
	@go vet ./...

.PHONY: clean
clean:
	@rm -f server *.test *.out

.PHONY: print
print: server
	@./$^ -print > docs/index.html

.PHONY: run
run: server
	@./$^
