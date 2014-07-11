Locator = require './locator'

class ChangesLocator extends Locator
  @dimensions [
    'id'
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

module.exports = ChangesLocator
