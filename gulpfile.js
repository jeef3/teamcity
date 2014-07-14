'use strict';

var $ = require('gulp-load-plugins')();
var gulp = require('gulp');
var rimraf = require('rimraf');

require('coffee-script/register');

gulp.task('test', function () {
  return gulp.src('test/**/*.coffee')
    .pipe($.mocha({
      reporter: 'dot',
      compilers: 'coffee:coffee-script/register'
    }));
});

gulp.task('build', ['clean'], function () {
  return gulp.src('src/**/*.coffee')
    .pipe($.coffee())
    .pipe(gulp.dest('lib/'));
});

gulp.task('clean', function (done) {
  rimraf('./lib', done);
});

gulp.task('watch', function () {
  gulp.watch([
    'src/**/*.coffee',
    'test/**/*.spec.coffee'
  ], ['test']);
});
