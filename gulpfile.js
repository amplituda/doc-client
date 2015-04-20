'use strict';

var gulp = require('gulp');

var vcl = require('gulp-vcl-preprocessor');
var webserver = require('gulp-webserver');

gulp.task('css', function() {
  gulp.src('./package.json')
    .pipe(vcl({
      package: true,
      output: 'vcl.css',
      includeDevDependencies: true
    }))
    .pipe(gulp.dest('./'));
});

gulp.task('server', function() {
  gulp.src('./')
    .pipe(webserver({
      livereload: true,
      directoryListing: true,
      open: true,
      port: 1337
    }));
});
