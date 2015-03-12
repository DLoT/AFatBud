factories = null
require = null

describe 'AFatBud', ->

  class AbstractFactoryMock

  config =
    AFactory: ->
    BFactory: ->

  aFatBud = null
  beforeEach ->
    aFatBud = new AFatBud AbstractFactoryMock, config

  describe '#constructor', ->
    it 'it should apply options',  ->
      expect(aFatBud.config).toBe config


  describe '#parseConfig', ->
    it 'should create Factories according to given config', ->
      aFatBud.parseConfig()
      expect(aFatBud.structure.AFactory).toBeInstanceOf AbstractFactoryMock
      expect(aFatBud.structure.BFactory).toBeInstanceOf AbstractFactoryMock




  describe '#isFactory', ->
    it 'should return true if first letter is capital', ->
      expect(aFatBud.isFactory 'SomeFactory').toBeTruthy()

    it 'should return false if first letter isnt capital', ->
      expect(aFatBud.isFactory 'someAttribute').toBeFalsy()
