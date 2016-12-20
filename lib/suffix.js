
var root = this
// AMD / RequireJS
if (typeof define !== 'undefined' && define.amd) {
    define([], function () {
        return json_parser;
    });
}
// Node.js
else if (typeof module !== 'undefined' && module.exports) {
    module.exports = json_parser;
}
// included directly via <script> tag
else {
    root.json_parser = json_parser;
}

