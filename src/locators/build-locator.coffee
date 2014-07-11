Locator = require './locator'

class BuildLocator extends Locator
  @dimensions [
    'buildType'
    'tags'
    'status'
    'user'
    'personal'
    'canceled'
    'running'
    'pinned'
  ]

module.exports = BuildLocator
