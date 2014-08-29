var gulp = require('gulp');
var jade = require('gulp-jade');
var coffee = require('gulp-coffee');
var watch = require('gulp-watch');
var gutil = require('gulp-util');

gulp.task('templates', function() {
  return gulp.src('./app/templates/*.jade')
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest('./public/templates/'))
});

gulp.task('coffee', function() {
  gulp.src('./app/scripts/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./public/scripts/'))
});

gulp.task('watch', function() {
  gulp.watch('./app/templates/*.jade', ['templates']);
  gulp.watch('./app/scripts/*.coffee', ['coffee']);

});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['watch', 'templates', 'coffee']);
