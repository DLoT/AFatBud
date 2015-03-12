factories = null
require = null

describe 'AFatBud.AbstractFactory', ->

  class AClass

  class BClass


  factories = {
    SomeFactoryName:
      AClass: AClass
      BClass: BClass
  }

  require = jasmine.createSpy('require').and.callFake (name) -> factories[name]

  factory = null
  beforeEach ->
    factory = new AbstractFactory 'SomeFactoryName'

  describe '#constructor', ->
    it 'should require the according factory members',  ->
      expect(require).toHaveBeenCalledWith 'SomeFactoryName'

    it 'should apply the required members', ->
      expect(factory.AClass).toEqual AClass
      expect(factory.BClass).toEqual BClass


  describe '#getInstanceOf', ->
    it 'should return an instance of given member', ->
      expect(factory.getInstanceOf 'AClass').toBeInstanceOf AClass
      expect(factory.getInstanceOf 'BClass').toBeInstanceOf BClass

    it 'should throw an error if given member is undefined', ->
      undefinedClassName = 'CClass'
      expect( -> factory.getInstanceOf undefinedClassName).toThrow new Error "I've got no #{undefinedClassName} in my Members!"
