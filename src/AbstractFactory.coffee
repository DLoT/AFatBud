class AbstractFactory
  constructor: (factoryName) ->
    @applyMembers require factoryName


  applyMembers: (factoryMembers) ->
    for key, memeber of factoryMembers
      @[key] = memeber


  getInstanceOf: (className, config) ->
    throw new Error "I've got no #{className} in my Members!" unless @[className]
    new @[className](config)
