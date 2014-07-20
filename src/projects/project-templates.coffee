Locatable = require '../locatable'
BuildTypeLocator = require '../locators/build-type-locator'

class ProjectTemplates extends Locatable
  @path '/templates'
  @locator BuildTypeLocator

  constructor: (@client, @parent) ->
    super @client, @parent

module.exports = ProjectTemplates
