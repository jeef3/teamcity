class Locatable
  @path: (path) ->
    @constructor.path = path

  constructor: (@client, @parent, @locatorType) ->

  get: (id, cb) ->
    @locator = new @locatorType
    @locator.id id

    if cb then @client._get @getPath()
    this

  all: (cb) ->
    @locator = null
    if cb then @client._get @path, cb
    this

  getPath: ->
    throw new Error 'Locator is required to get path' unless @locator
    "#{@path}/#{@locator.compile()}"

module.exports = Locatable
