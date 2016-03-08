class Locatable
  @path: (path) ->
    @_path = path

  @locator: (locator) ->
    @_locator = locator

  constructor: (@client, @parent) ->

  get: (locator, cb) ->
    if typeof locator is 'number' or typeof locator is 'string'
      @locator = new @constructor._locator
      @locator.id locator
    else if locator.compile
      @locator = locator
    else
      @locator = new @constructor._locator
      @locator.locators = locator

    if cb then @client._get @getPath(), cb
    this

  all: (cb) ->
    @locator = null
    if cb then @client._get @getPath(), cb
    this

  by: (locator, cb) ->
    if locator.compile
      @locator = locator
    else
      @locator = new @constructor._locator
      @locator.locators = locator

    if cb then @client._get @getPath(null, true), cb

    this

  getPath: (child, list) ->
    parts = []

    if @parent then parts.push @parent.getPath()

    parts.push @constructor._path

    if list
      if @locator then parts.push "?locator=#{@locator.compile()}"
    else
      if @locator then parts.push "/#{@locator.compile()}"

    if child then parts.push "/#{child}"

    parts.join ''


module.exports = Locatable
