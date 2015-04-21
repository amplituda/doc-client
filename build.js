'use strict';

var fs = require('fs');
var riot = require('riot');

var rawHtml = exports.rawHtml = fs.readFileSync(__dirname + '/index.html', 'utf8');

// TODO: document this better
exports.getBuild = function(doc, cb) {
  // compile riot tags
  var tagDir = __dirname + '/tags/';
  var inlineScript = '';
  fs.readdir(tagDir, function(err, files) {
    if (err) throw err;
    files.forEach(function(file) {
      // TODO: async!
      var tag = fs.readFileSync(tagDir + file, 'utf8');
      inlineScript += riot.compile(tag);
    });

    inlineScript += '\nwindow.prod = true;\n';

    if (doc){
      var stringDoc = JSON.stringify(doc, null, 2);
      inlineScript += '\nwindow.doc = ' + stringDoc + ';';
    }

    var prodStuff = [
      '<script src=\'https://cdnjs.cloudflare.com/ajax/libs/riot/2.0.14/riot.min.js\'></script>',
      '<script>',
      inlineScript,
      '</script>'
    ];
    var prodText = prodStuff.join('\n');
    var done = rawHtml.replace(/<!-- prod -->(.|\n)*<!-- prod -->/gm, prodText);

    // add vcl style
    var style = '<style>' +
      fs.readFileSync(__dirname + '/vcl.css', 'utf8') +
      '\n</style>';
    done = done.replace(/<!-- prodstyle -->(.|\n)*<!-- prodstyle -->/gm, style);

    //fs.writeFileSync('./index-prod.html', done);
    if (cb) cb(done);
  });
};
