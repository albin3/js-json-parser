# editor-json-parser

this repo support parse standard [json](http://json.org/) and something like this:

[![Build Status][travis-image]][travis-url]
[![NPM Version][npm-image]][npm-url]
[![NPM Downloads][downloads-image]][downloads-url]

> support: AMD / CommonJs / script tag

```
{
  "foo": 'bar'
}

{
  foo: 'bar'
}

{
  'foo': "bar"
}
```

> it also support comments and comma at last line

```
{
  // comment
  foo: 'bar'    // comment
}

{
  foo: 'bar',
  foo1: 'bar1',
}
```

## commonjs usage

`npm install --save editor-json-parser`

```js
let parser = require('editor-json-parser');
let result = parser.parse("{foo: 'bar'}");
// result: {foo: 'bar'}
result = parser.parse("{'foo': 'bar'}");
// result: {foo: 'bar'}
result = parser.parse('{"foo": "bar"}');
// result: {foo: 'bar'}
```

## script tag

```js
<script src="./dist/json_parser.js"><script/>

var jsonParser = window.json_parser;
```

## AMD support

...

[travis-image]: https://api.travis-ci.org/albin3/editor-json-parser.svg
[travis-url]: https://travis-ci.org/albin3/editor-json-parser
[npm-image]: https://img.shields.io/npm/v/editor-json-parser.svg
[npm-url]: https://npmjs.org/package/editor-json-parser
[downloads-image]: https://img.shields.io/npm/dm/editor-json-parser.svg
[downloads-url]: https://npmjs.org/package/editor-json-parser

