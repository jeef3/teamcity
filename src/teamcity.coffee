Client = require './client'
Locator = require './locator'

module.exports =
  client: (options) ->
    return new Client options

  locator: ->
    return new Locator
