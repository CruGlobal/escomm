/**
 *  Welcome to your gulpfile!
 *  The gulp tasks are splitted in several files in the gulp directory
 *  because putting all here was really too long
 */

'use strict';

var gulp     = require('gulp');
var wrench   = require('wrench');
var gettext = require('gulp-angular-gettext');

/**
 *  This will load all js or coffee files in the gulp directory
 *  in order to load all gulp tasks
 */
wrench.readdirSyncRecursive('./gulp').filter(function(file) {
  return (/\.(js|coffee)$/i).test(file);
}).map(function(file) {
  require('./gulp/' + file);
});

gulp.task('pot', function () {
    return gulp.src(['src/app/main/*.html', 'src/*.html', 'src/app/views/*.html'])
        .pipe(gettext.extract('template.pot', {
            // options to pass to angular-gettext-tools... 
        }))
        .pipe(gulp.dest('po/'));
});
 
gulp.task('translations', function () {
  return gulp.src('po/**/*.po')
    .pipe(gettext.compile({
        // options to pass to angular-gettext-tools... 
        }))
    .pipe(gulp.dest('src/app/translations'));
});

/**
 *  Default task clean temporaries directories and launch the
 *  main optimization build task
 */
gulp.task('default', ['clean'], function () {
  gulp.start('pot');
  gulp.start('translations');
  gulp.start('build');
});

// Copies fonts to /dist (for Bootstrap glyphicons)
gulp.task('fonts', function() {
    return gulp.src('./node_modules/bootstrap/fonts/*')
        .pipe(gulp.dest('./dist/fonts'))
});