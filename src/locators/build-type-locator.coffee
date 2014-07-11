Locator = require './locator'

class BuildTypeLocator extends Locator
  @dimensions [
    'id'
    'name'
    'internalId'
    'project'
    'affectedProject'
    'template'
    'templateFlag'
    'paused'
  ]

module.exports = BuildTypeLocator
