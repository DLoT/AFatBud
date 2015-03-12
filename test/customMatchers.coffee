customMatchers =
  toBeInstanceOf: ->
    compare: (actual, expected) ->
      expected  = '' unless expected
      result =
        pass: actual instanceof expected
        message: "Expected: #{actual.constructor.name} is instanceof #{expected.name}"

      if result.pass
        result.message = "Expected: #{actual.constructor.name} is not instanceof #{expected.name}"
      result

beforeEach ->
  jasmine.addMatchers customMatchers
