Locatable = require './locatable'
BuildTypeLocator = require './locators/build-type-locator'

class BuildTypes extends Locatable
  constructor: (@client) ->
    super @client, new BuildTypeLocator


