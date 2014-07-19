Locatable = require './locatable'
BuildLocator = require './locators/build-locator'

class Builds extends Locatable
  @path '/app/rest/builds'
  @locator BuildLocator

  constructor: (@client) ->
    super @client, null

  destroy: (cb) ->
    throw new Error 'Build locator required to destroy' unless @locator
    @client._destroy @getPath(), cb

  buildLog: (cb) ->
    if !@locator.locators.id then throw new Error 'Can only get build log by build id'

    @client._get '/downloadBuildLog.html', buildId: @locator.locators.id
    this

  statistics: (name, cb) ->
    if !cb
      @client._get @getPath('statistics'), cb
    else
      @client._get @getPath("statistics/#{name}"), cb

module.exports = Builds
