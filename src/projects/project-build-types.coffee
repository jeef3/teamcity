Locatable = require '../locatable'
BuildTypeLocator = require '../locators/build-type-locator'

class ProjectBuildTypes extends Locatable
  @path '/buildTypes'

  constructor: (@client, @parent) ->
    super @client, @parent, BuildTypeLocator

  create: (buildType, cb) ->
    @client._post @getPath(), buildType, cb

  field: (field, cb) ->
    @client._get @getPath(field), cb

module.exports = ProjectBuildTypes
