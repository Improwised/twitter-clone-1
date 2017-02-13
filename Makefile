# node modules in executable path
PATH := node_modules/.bin:$(PATH)

# OSX requires this variable exported so that PATH is also exported.
SHELL := /bin/bash

JS_SRC = $(shell find . -type f -name '*.js' ! -path './node_modules/*')
JSON_SRC = $(shell find . -type f -name '*.json' ! -path './node_modules/*')

.PHONY: lint test

lint:
	jsonlint -q -c ${JSON_SRC}
	eslint ${JS_SRC} ${ESLINT_ARGS}

test: lint
	export PGDB_TCP_PORT=5432
	export PGDB_TCP_HOST=127.0.0.1
	export PGDB_USER=postgres
	export PGDB_DB=jatin
	export PGDB_DB=test_twitter

