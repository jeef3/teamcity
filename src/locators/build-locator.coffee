Locator = require './locator'

class BuildLocator extends Locator
  @dimensions [
    'id'
    'buildType'
    'tags'
    'status'
    'user'
    'personal'
    'canceled'
    'running'
    'pinned',
    'branch'
  ]

module.exports = BuildLocator
