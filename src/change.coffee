class Change
  constructor: (@locator, @client) ->

  info: (cb) ->
    if typeof @locator isnt 'number' and typeof @locator isnt 'string'
      throw 'Calls to info require a change ID'

    @client._get "/changes/#{@locator}", cb

  query: (cb) ->
    if typeof @locator is 'number' or typeof @locator is 'string'
      @client._get "/changes/#{@locator}", cb
    else
      # @client._get "/changes?locator=#{@locator.locator}", cb
      @client._get '/changes', @locator, cb

module.exports = Change
