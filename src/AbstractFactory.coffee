class AbstractFactory
  constructor: (factoryMembers) ->
    @applyMembers factoryMembers


  applyMembers: (factoryMembers) ->
    for key, memeber of factoryMembers
      @[key] = memeber


  getInstanceOf: (className, config) ->
    throw new Error "I've got no #{className} in my Members!" unless @[className]
    new @[className](config)

module.exports = AbstractFactory
