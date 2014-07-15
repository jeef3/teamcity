Locator = require './locator'

class ChangeLocator extends Locator
  @dimensions [
    'id',
    'branch',
    'project'
    'buildType'
    'build'
    'vcsRoot'
    'vcsRootInstance'
    'username'
    'user'
    'version'
    'internalVersion'
    'comment'
    'file'
    'sinceChange'
    'lookupLimit'
    'start'
    'count'
  ]

module.exports = ChangeLocator
