class ParameterSet
  @path: (path) ->
    @_path = path

  @parameters: (parameters) ->

  constructor: (@client, @parent) ->

  get: (param, cb) ->
    @client._get @getPath(param), cb

  set: (param, value, cb) ->
    @client._post @getPath(param), value, cb

  all: (cb) ->
    @client._get @getPath(), cb

  getPath: (param) ->
    parts = []

    if @parent then parts.push @parent.getPath()

    parts.push  @constructor._path

    if param then parts.push "/#{param}"

    parts.join ''

module.exports = ParameterSet
