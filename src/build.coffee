class Build
  constructor: (@id, @client) ->

  info: (cb) ->
    @client._get "/builds/#{@id}", null, cb

  query: (locator, cb) ->
    @client._get "/builds/?locator=#{locator.compile()}", null, cb

module.exports = Build
