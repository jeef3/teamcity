Locatable = require './locatable'
VcsRootInstanceLocator = require './locators/vcs-root-instance-locator'

class VcsRootInstances extends Locatable
  @path '/app/rest/vcs-root-instances'
  @locator VcsRootInstanceLocator

module.exports = VcsRootInstances
