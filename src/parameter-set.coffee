class ParameterSet
  @path: (path) ->
    @constructor.path = path

  @parameters (parameters) ->

  constructor: (@client, @parent) ->

  get: (param, cb) ->
    @client._get @path(), cb

  set: (param, value, cb) ->
    @client._post @path(), cb

  getPath: ->
    if @parent
      path = @parent.getPath()

    path += @path
    path

