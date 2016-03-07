Locator = require './locator'

class BuildQueueLocator extends Locator
  @dimensions [
    'id',
    'project',
    'buildType'
  ]

module.exports = BuildQueueLocator
