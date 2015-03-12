gulp        = require "gulp"
gutil       = require "gulp-util"
plugins     = require("gulp-load-plugins")(lazy: false)
compile     = require "gulp-compile-js"
karma       = require 'gulp-karma'
chalk       = require "chalk"
path        = require "path"

gulp.task "scripts", ->
  sources =[
    "!./src/**/*.spec.coffee"
    "./src/**/*.coffee"
  ]
  gulp.src(sources)
  .pipe(
    compile
      coffee:
        bare: true
  )
  .pipe(plugins.concat("afatbud.js"))
  .pipe gulp.dest("./build")
  return


gulp.task "watchSourceFiles", ->
  sources = [
    "./src/**/*.coffee"
  ]
  gulp.watch sources, ["scripts", "karma-unit"]
  return

gulp.task "karma-unit", ->
  gulp.src('./idontexist')
  .pipe(karma
    configFile: './karma-unit.coffee'
    action: 'run'
  )
  .on 'error', (err) ->
    #throw err
  return

gulp.task "default", [
  "scripts"
  "karma-unit"
  "watchSourceFiles"
]
