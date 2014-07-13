Locator = require './locator'

class BuildQueueLocator extends Locator
  @dimensions [
    'project',
    'buildType'
  ]

module.exports = BuildQueueLocator
