class AFatBud
  structure: {}
  constructor: (@config) ->

  parseConfig: ->
    for key, value of @config
      if @isFactory key
        Factory = require key
        throw new Error "Error: Can't require #{key}" unless Factory
        @structure[key] = new Factory

  isFactory: (key) ->
    /^[A-Z]/.test key


