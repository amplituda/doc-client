'use strict';

var gulp = require('gulp');

var vcl = require('gulp-vcl-preprocessor');

gulp.task('css', function() {
  gulp.src('./package.json')
    .pipe(vcl({
      package: true,
      output: 'vcl.css',
      includeDevDependencies: true
    }))
    .pipe(gulp.dest('./'));
});
