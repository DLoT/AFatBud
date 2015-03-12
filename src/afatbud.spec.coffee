factories = null
require = null

describe 'AFatBud', ->

  class AFactory

  class BFactory

  factories = {
    AFactory: AFactory
    BFactory: BFactory
  }

  require = (name) ->
    factories[name]

  config =
    AFactory:
      type: 'someType'
    BFactory:
      type: 'someOthertype'

  aFatBud = null
  beforeEach ->
    aFatBud = new AFatBud(config)

  describe '#constructor', ->
    it 'it should apply options',  ->
      expect(aFatBud.config).toBe config


  describe '#parseConfig', ->
    it 'should create Factories according to given config', ->
      aFatBud.parseConfig()
      expect(aFatBud.structure.AFactory).toBeInstanceOf AFactory
      expect(aFatBud.structure.BFactory).toBeInstanceOf BFactory


  describe '#isFactory', ->
    it 'should return true if first letter is capital', ->
      expect(aFatBud.isFactory 'SomeFactory').toBeTruthy()

    it 'should return false if first letter isnt capital', ->
      expect(aFatBud.isFactory 'someAttribute').toBeFalsy()
