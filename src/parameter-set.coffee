class ParameterSet
  @path: (path) ->
    @_path = path

  @parameters: (parameters) ->
    @addParameter(p) for p in parameters

  @addParameter = (name) ->
    @prototype[name] = (value, cb) ->
      if typeof value is 'function'
        cb = value
        @get name, cb
      else
        @set name, value, cb
      this
    this

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
