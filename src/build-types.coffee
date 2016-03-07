Locatable = require './locatable'
BuildTypeLocator = require './locators/build-type-locator'

class BuildTypes extends Locatable
  @path '/app/rest/buildTypes'
  @locator BuildTypeLocator

module.exports = BuildTypes
