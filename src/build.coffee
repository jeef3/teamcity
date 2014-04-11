class Build
  constructor: (@id, @client) ->

  info: (cb) ->
    @client._get "/builds/#{@id}", null, cb

module.exports = Build
