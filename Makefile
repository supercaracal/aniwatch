SHELL    := /bin/bash -euo pipefail
BIN_NAME := server

all: build test lint

build:
	@go build -ldflags="-s -w" -trimpath -tags timetzdata -o ${BIN_NAME}

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

lint:
	@go vet ./...
	@golint -set_exit_status ./...

clean:
	@rm -f ${BIN_NAME} main *.test *.out

print: clean build
	@./${BIN_NAME} -print > docs/index.html

.PHONY: all build test bench prof lint clean print
