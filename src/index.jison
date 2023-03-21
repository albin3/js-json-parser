%lex

int  "-"?([0-9]|[1-9][0-9]+)
exp  [eE][-+]?[0-9]+
frac  "."[0-9]+

%%
[\s↵]+      /* skip whitespace */
[\/\/].*\n                                     /* skip comments */

{int}{frac}?{exp}?\b    return 'NUMBER'
\"(?:\\[\\"]|[^\0-\x09\x0a-\x1f"])*\"    yytext = yytext.substr(1,yyleng-2); return 'STRING'
\'(?:\\[\\']|[^\0-\x09\x0a-\x1f'])*\'    yytext = yytext.substr(1,yyleng-2); return 'STRING'

"{"            return '{'
"}"            return '}'
"["            return '['
"]"            return ']'
","            return ','
":"            return ':'
"true"         return 'TRUE'
"false"        return 'FALSE'
"null"         return 'NULL'
"undefined"    return 'UNDEFINED'

[a-zA-Z0-9_\u4e00-\u9fa5]+   return 'JSONKEY'

<<EOF>>        return 'EOF'
.              return 'INVALID'

%%

/lex

%start JSONText

/*
  ECMA-262 5th Edition, 15.12.1 The JSON Grammar.
*/

%%

JSONString
    : STRING
        { // replace escaped characters with actual character
          $$ = backslash(yytext);
        }
    ;

JSONNumber
    : NUMBER
        {$$ = Number(yytext);}
    ;


JSONUndefinedLiteral
    : UNDEFINED
        {$$ = undefined;}
    ;

JSONNullLiteral
    : NULL
        {$$ = null;}
    ;

JSONBooleanLiteral
    : TRUE
        {$$ = true;}
    | FALSE
        {$$ = false;}
    ;

JSONText
    : JSONValue EOF
        {return $$ = $1;}
    ;

JSONValue
    : JSONNullLiteral
    | JSONUndefinedLiteral
    | JSONBooleanLiteral
    | JSONString
    | JSONNumber
    | JSONObject
    | JSONArray
    ;

JSONObject
    : '{' '}'
        {{$$ = {};}}
    | '{' JSONMemberList '}'
        {$$ = $2;}
    ;

JSONMember
    : JSONString ':' JSONValue ','
        {$$ = [$1, $3];}
    | JSONKEY ':' JSONValue ','
        {$$ = [$1, $3];}
    | JSONString ':' JSONValue
        {$$ = [$1, $3];}
    | JSONKEY ':' JSONValue
        {$$ = [$1, $3];}
    ;

JSONMemberList
    : JSONMember
        {{$$ = {};  $$[$1[0]] = $1[1];}}
    | JSONMemberList JSONMember
        {$$ = $1; $1[$2[0]] = $2[1];}
    ;

JSONArray
    : '[' ']'
        {$$ = [];}
    | '[' JSONElementList ']'
        {$$ = $2;}
    ;

JSONElementList
    : JSONValue
        {$$ = [$1];}
    | JSONElementList ',' JSONValue
        {$$ = $1; $1.push($3);}
    ;

%%
const backslash = require('../lib/backslash');