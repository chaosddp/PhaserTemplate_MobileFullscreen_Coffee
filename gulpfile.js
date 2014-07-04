var gulp = require("gulp");
var coffee = require("gulp-coffee");


gulp.task("build", function(){

    return gulp.src("src/**/*.litcoffee")
        .pipe(coffee())
        .pipe(gulp.dest("js"));

});

gulp.task("default", ["build"]);