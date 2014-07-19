Locatable = require '../locatable'

class ProjectBuildTypes extends Locatable
  @path '/buildTypes'

  constructor: (@client, @parent) ->
    super @client, @parent, BuildTypeLocator

  create: (buildType, cb) ->
    @client._post @getPath(), buildType, cb

module.exports = ProjectBuildTypes
