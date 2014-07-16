class Locatable
  constructor: (@client, @byLocator) ->
    @by = @byLocator
    @by.locate = (cb) =>
      if cb then @client._get "#{@path}/#{@byLocator.compile()}", cb
      this

  @path: (path) ->
    @prototype.path = path

  get: (id, cb) ->
    if cb then @client._get "#{@path}/#{id}"
    @id = id
    this

  all: (cb) ->
    if cb then @client._get @path, cb
    this

  located: (path) ->
    "#{@path}/#{@byLocator.compile()}#{path}"

module.exports = Locatable
