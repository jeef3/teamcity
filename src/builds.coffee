Locatable = require './locatable'
BuildLocator = require './locators/build-locator'

class Builds extends Locatable
  constructor: (@client) ->
    super @client, new BuildLocator
    @path = '/app/rest/builds'

  buildLog: (cb) ->
    if !@id then throw new Error 'Can only get build log by build id'

    @client._get '/downloadBuildLog.html', buildId: @id
    this

  statistics: (cb) ->
    @client._get @located('/statistics')

module.exports = Builds
