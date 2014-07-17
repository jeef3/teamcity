class Locatable
  constructor: (@client, @base, @locator) ->
    @by = @locator
    @by.locate = (cb) =>
      if cb then @client._get "#{@path}/#{@locator.compile()}", cb
      this

  @path: (path) ->
    @prototype.path = path

  get: (id, cb) ->
    if cb then @client._get "#{@path}/id:#{id}"
    @id = id
    this

  all: (cb) ->
    if cb then @client._get @path, cb
    this

  located: (path) ->
    if path
      "#{@path}/#{@locator.compile()}/#{path}"
    else
      "#{@path}/#{@locator.compile()}"

  locatorNeeded: ->
    throw new Error 'Locator required' unless @locator

module.exports = Locatable
