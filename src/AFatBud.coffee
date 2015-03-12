class AFatBud
  structure: {}
  constructor: (@AbstractFactory, @config) ->

  parseConfig: ->
    for key, value of @config
      if @isFactory key
        @structure[key] = new @AbstractFactory key

  isFactory: (key) ->
    /^[A-Z]/.test key



