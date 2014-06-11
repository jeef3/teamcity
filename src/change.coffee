class Change
  constructor: (@id, @client) ->

  # FIXME: These are basically the same??
  info: (cb) ->
    if typeof @locator isnt 'number' and typeof @locator isnt 'string'
      throw 'Calls to info require a change ID'

    @client._get "/changes/#{@locator}", cb

  query: (locator, cb) ->
    @client._get "/changes?locator=#{locator.compile()}", null, cb

module.exports = Change
