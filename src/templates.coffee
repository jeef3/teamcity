Locatable = require './locatable'
BuildTypeLocator = require './locators/build-type-locator'

class ProjectTemplates extends Locatable
  @path '/templates'

  constructor: (@client, @projectLocator) ->
    super @client, new BuildTypeLocator
