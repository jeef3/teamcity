BuildTypeLocator = require './locators/build-type-locator';

class BuildTypes
  constructor: (@client) ->

  info: (id, cb) ->
    @locate new BuildTypeLocator().id(id), cb

  all: (cb) ->
    @client._get '/buildTypes', cb

  locate: (locator, cb) ->
    @client._get '/buildTypes', locate: locator.compile(), cb

module.exports = BuildTypes
