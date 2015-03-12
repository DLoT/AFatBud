customMatchers =
  toBeInstanceOf: ->
    compare: (actual, expected) ->
      expected  = '' unless expected
      return result = message: "Expection is undefined on custom Matcher toBeInstanceOf" unless actual
      result =
        pass: actual instanceof expected
        message: "Expected: #{actual.constructor.name} is instanceof #{expected.name}"

      if result.pass
        result.message = "Expected: #{actual.constructor.name} is not instanceof #{expected.name}"
      result

beforeEach ->
  jasmine.addMatchers customMatchers
