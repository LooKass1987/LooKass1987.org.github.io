/*! Flexibility 2.0.0 | MIT Licensed | github.com/jonathantneal/flexibility */

var read  = require('./read/index');
var write = require('./write/index');

var readAll  = require('./readAll/index');
var writeAll = require('./writeAll/index');

module.exports = flexibility;

module.exports.read  = read;
module.exports.write = write;

module.exports.readAll  = readAll;
module.exports.writeAll = writeAll;

function flexibility(target) {
	writeAll(readAll(target));
}
