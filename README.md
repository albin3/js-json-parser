# editor-json-parser

this repo support parse standard [json](http://json.org/) and something like this:

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
