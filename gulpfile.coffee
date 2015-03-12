gulp        = require "gulp"
gutil       = require "gulp-util"
plugins     = require("gulp-load-plugins")(lazy: false)
coffeeify   = require 'gulp-coffeeify'
browserify  = require 'gulp-browserify'
rename      = require 'gulp-rename'
karma       = require 'gulp-karma'
chalk       = require "chalk"
path        = require "path"

gulp.task "scripts", ->
  sources =[
    "!./src/**/*.spec.coffee"
    "./src/**/*.coffee"
  ]
  gulp.src(sources, read: false )
  .pipe coffeeify()
  .pipe browserify()
  .pipe rename("afatbud.js")
  .pipe gulp.dest("./build")
  return


gulp.task "watchSourceFiles", ->
  sources = [
    "./src/**/*.coffee"
  ]
  gulp.watch sources, ["scripts"]
  return

gulp.task "karma-unit", ->
  gulp.src('./idontexist')
  .pipe(karma
    configFile: './karma-unit.coffee'
    action: 'watch'
  )
  .on 'error', (err) ->
    #throw err
  return



gulp.task "default", [
  "scripts"
  "karma-unit"
  "watchSourceFiles"
]
