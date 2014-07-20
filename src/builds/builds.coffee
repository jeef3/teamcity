Locatable = require '../locatable'
BuildLocator = require '../locators/build-locator'
BuildStatistics = require './build-statistics'

class Builds extends Locatable
  @path '/app/rest/builds'
  @locator BuildLocator

  constructor: (@client, @parent) ->
    super @client, @parent

    Object.defineProperty @,
      'statistics',
      get: -> return new BuildStatistics @client, @

  destroy: (cb) ->
    throw new Error 'Build locator required to destroy' unless @locator
    @client._destroy @getPath(), cb

  buildLog: (cb) ->
    if !@locator.locators.id then throw new Error 'Can only get build log by build id'

    @client._get '/downloadBuildLog.html', buildId: @locator.locators.id
    this

module.exports = Builds
