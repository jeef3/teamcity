class Build
  constructor: (@client) ->

  info: (id, cb) ->
    @client._get "/builds/#{@id}", null, cb

  all: ->
    @client._get '/builds', null, cb

  locate: (locator, cb) ->
    console.log 'locating'
    @client._get '/builds', locator: locator.compile(), cb

module.exports = Build
