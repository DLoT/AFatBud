module.exports = (config) ->

  config.set
  # base path, that will be used to resolve files and exclude
    basePath: ''

  # list of files / patterns to load in the browser
    files: [
      'build/bundle.js'
      'src/**/*.spec.coffee'
      'test/**/*.coffee'
    ]
  # list of files to exclude
    exclude: []

    preprocessors:
      'src/**/*.spec.coffee': ['browserify']
      'test/customMatchers.coffee': ['coffee']
      'test/FactoryMembersMock.coffee': ['browserify']

    browserify:
      debug: true
      transform: [ 'coffeeify']
      extensions: ['.coffee']

  # web server port
    port: 9876

  # enable / disable colors in the output (reporters and logs)
    colors: yes

  # level of logging
  # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO

  # enable / disable watching file and executing tests whenever any file changes
    autoWatch: no

  # Start these browsers, currently available:
  # - Chrome
  # - ChromeCanary
  # - Firefox
  # - Opera
  # - Safari
  # - PhantomJS
    browsers: ['PhantomJS']


  # Continuous Integration mode
  # if true, it capture browsers, run tests and exit
    singleRun: no

    frameworks: ['browserify', 'jasmine']

    plugins: [
      'karma-browserify',
      'karma-jasmine'
      'karma-phantomjs-launcher'
      'karma-coffee-preprocessor'
    ]
