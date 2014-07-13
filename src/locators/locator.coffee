class Locator

  constructor: ->
    @locators = {}

  @dimensions: (dimensions) ->
    @addDimension(d) for d in dimensions

  @addDimension = (name) ->
    @prototype[name] = (value) ->
      if typeof value.compile is 'function'
        @locators[name] = value.compile()
      else
        @locators[name] = value
      this
    this

  compile: ->
    str = ''

    for name, locator of @locators

      if typeof locator is 'string' or typeof locator is 'number'
        str = "#{str}#{name}:#{locator}"
      else if typeof locator.compile  == 'function'
        str = "#{str}#{name}:(#{locator.compile()})"
      else

        str = "#{str}#{name}:("
        for key, value of locator
          str = "#{str}#{key}:#{value},"

        str = str.substring 0, str.length - 1
        str = "#{str})"

      str = "#{str},"

    str = str.substring 0, str.length - 1
    str

module.exports = Locator
