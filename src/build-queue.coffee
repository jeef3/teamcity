Locatable = require './locatable'
BuildQueueLocator = require './locators/build-queue-locator'

class BuildQueue extends Locatable
  @path '/app/rest/buildQueue'
  @locator BuildQueueLocator

  trigger: (build, cb) ->
    @client._post @getPath(), build, cb

module.exports = BuildQueue
