class Locator

  constructor: ->
    @locators = {}

  @dimensions: (dimensions) ->
    for dimension in dimensions
      @[dimension] = (value) ->
        @_add dimension, value

  compile: ->
    str = ''

    for name, locator of @locators

      if typeof locator is 'string' or typeof locator is 'number'
        str = "#{str}#{name}:(#{locator})"
      else if locator is Locator
        str = "#{str}#{name}:(#{locator.build()})"
      else

        str = "#{str}#{name}:("
        for key, value of locator
          str = "#{str}#{key}:#{value},"

        str = str.substring 0, str.length - 1
        str = "#{str})"

      str = "#{str},"

    str = str.substring 0, str.length - 1
    str

  _add: (name, value) ->
    if typeof value.compile is 'function'
      @locators[name] = value.compile()
    else
      @locators[name] = value

    this

module.exports = Locator
