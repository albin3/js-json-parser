# editor-json-parser

this repo support parse standard [json](http://json.org/) and something like this:

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
## usage

`npm install --save editor-json-parser`

```
let parser = require('editor-json-parser');
let result = parser.parse('{foo: 'bar'}');
// result: {foo: 'bar'}
```
