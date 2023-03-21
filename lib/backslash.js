'use strict';

function backslash(str, pos = 0) {
  let escaped = false;
  const ret = [];
  while (pos < str.length) {
    const c = str[pos++];
    if (escaped) {
      escaped = false;
      switch (c) {
        case 'n':
          ret.push('\n');
          continue;
        case 'r':
          ret.push('\r');
          continue;
        case 'f':
          ret.push('\f');
          continue;
        case 'b':
          ret.push('\b');
          continue;
        case 't':
          ret.push('\t');
          continue;
        case 'v':
          ret.push('\v');
          continue;
        case '\\':
          ret.push('\\') ;
          continue;
        case '"':
          ret.push('"') ;
          continue;
        case '\'':
          ret.push('\'') ;
          continue;
        case 'u':
          const num = str.slice(pos, pos + 4);
          if(num.match(/^[a-fA-F0-9]{4}$/)){
            ret.push(String.fromCharCode(parseInt(num, 16)));
            pos += 4;
            continue;
          }
          ret.push('\\u');
          continue;
        default:
          ret.push('\\' + c);
          continue;
      }
    }
    if (c === '\\') {
      escaped = true;
      continue;
    }
    ret.push(c);
  }
  return ret.join('');
}

module.exports = backslash;