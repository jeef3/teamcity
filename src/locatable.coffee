class Locatable
  @path: (path) ->
    @_path = path

  @locator: (locator) ->
    @_locator = locator

  constructor: (@client, @parent) ->

  get: (id, cb) ->
    @locator = new @locatorType
    @locator.id id

    if cb then @client._get @getPath(), cb
    this

  all: (cb) ->
    @locator = null
    if cb then @client._get @getPath, cb
    this

  by: (locator) ->
    debugger
    if locator.compile
      @locator = locator
    else
      @locator = new @constructor._locator
      @locator.locators = locator

    this

  getPath: ->
    throw new Error 'Locator is required to get path' unless @locator
    debugger
    "#{@constructor._path}/#{@locator.compile()}"

module.exports = Locatable
