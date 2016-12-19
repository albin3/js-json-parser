TEST = $(shell ls -S `find test -type f -name "*.test.js"`)

all: test

test:
	node --harmony ./node_modules/.bin/jison ./src/index.jison  -o ./dist/json_parser.js
	mocha $(TEST)

.PHONY: test watch install cov run dev
