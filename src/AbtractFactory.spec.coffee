factories = null

AbstractFactory = require './AbstractFactory'
FactoryMembersMock = require '../test/FactoryMembersMock'
console.log FactoryMembersMock


describe 'AFatBud.AbstractFactory', ->

  factory = null
  beforeEach ->
    factory = new AbstractFactory FactoryMembersMock

  describe '#constructor', ->
    it 'should apply the required members', ->
      expect(factory.AClass).toEqual FactoryMembersMock.AClass
      expect(factory.BClass).toEqual FactoryMembersMock.BClass


  describe '#getInstanceOf', ->
    it 'should return an instance of given member', ->
      expect(factory.getInstanceOf 'AClass').toBeInstanceOf FactoryMembersMock.AClass
      expect(factory.getInstanceOf 'BClass').toBeInstanceOf FactoryMembersMock.BClass

    it 'should throw an error if given member is undefined', ->
      undefinedClassName = 'CClass'
      expect( -> factory.getInstanceOf undefinedClassName).toThrow new Error "I've got no #{undefinedClassName} in my Members!"
