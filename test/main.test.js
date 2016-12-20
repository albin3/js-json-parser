'use strict';

let jsonParser = require('../');
let should = require('should');

describe ('json parser test.', function () {
  it ('base test', function () {
    let result = jsonParser.parse('{"foo": "bar", "list": [{"foo": "bar"}], "null": null, "number": 1.2E2, "中文": "中文", "boolean": true}');
    result.should.deepEqual({foo: 'bar', list: [{foo: 'bar'}], null: null, number: 1.2E2, 中文: '中文', boolean: true});
  });

  it ('undefined support', function () {
    let result = jsonParser.parse('{"foo": undefined}');
    result.should.deepEqual({foo: undefined});
  });

  it ('no double quotes key support', function () {
    let result = jsonParser.parse('{foo: "bar"}');
    result.should.deepEqual({foo: 'bar'});
  });

  it ('single quotes support', function () {
    let result = jsonParser.parse("{'foo': 'bar'}");
    result.should.deepEqual({foo: 'bar'});
  });
});

