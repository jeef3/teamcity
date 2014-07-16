class Locatable

  constructor: (@client, @path) ->

  locate: (locator, cb) ->
    # No locator, get everything
    if !cb and typeof locator is 'function'
      cb = locator
      @client._get @path, cb

    # Locator and callback, locate em
    else if cb
      identifier = if locator.compile then locator.compile() else locator
      @client._get "#{@path}/#{identifier}"

    # Locator, no callback, prepare to get the children
    else
      @locator = locator

    this


class Builds extends Locatable
  constructor: (@client) ->
    super @client, '/app/rest/builds'

  buildLog: ->
    @client._get '/downloadBuildLog'
    this


module.exports = Builds
