TEST = $(shell ls -S `find test -type f -name "*.test.js"`)

all: test

test:
	node --harmony ./node_modules/.bin/jison -m js ./src/index.jison  -o ./dist/json_parser.js
	cat lib/suffix.js >> ./dist/json_parser.js
	mocha $(TEST)

.PHONY: test watch install cov run dev
