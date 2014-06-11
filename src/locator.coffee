class Locator

  constructor: ->
    @locators = {}

  build: (props) -> @_add 'build', props
  buildType: (props) -> @_add 'buildType', props
  sinceChange: (props) -> @_add 'sinceChange', props
  branch: (props) -> @_add 'branch', props
  number: (props) -> @_add 'number', props

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

  _add: (name, props) ->
    if typeof props.compile is 'function'
      @locators[name] = props.compile()
    else
      @locators[name] = props

    this

module.exports = Locator
