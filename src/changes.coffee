Locatable = require './locatable'
ChangeLocator = require './locators/change-locator'

class Changes extends Locatable
  @path '/app/rest/changes'
  @locator ChangeLocator

module.exports = Changes
