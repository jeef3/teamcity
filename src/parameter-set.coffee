class ParameterSet
  @path: (path) ->
    @_path = path

  @parameters: (parameters) ->

  constructor: (@client, @parent) ->

  get: (param, cb) ->
    @client._get @getPath(param), cb

  set: (param, value, cb) ->
    @client._post @getPath(param), value, cb

  getPath: (param) ->
    if @parent then path = @parent.getPath()

    path += @constructor._path

    if param then path += "/#{param}"

    path

module.exports = ParameterSet
