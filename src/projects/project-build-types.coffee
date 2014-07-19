Locatable = require '../locatable'
BuildTypeLocator = require '../locators/build-type-locator'
BuildTypeBuilds = require '../build-type-builds'

class ProjectBuildTypes extends Locatable
  @path '/buildTypes'
  @locator BuildTypeLocator

  constructor: (@client, @parent) ->
    super @client, @parent

    Object.defineProperty @,
      'builds',
      get: ->
        new BuildTypeBuilds @client, @

  create: (buildType, cb) ->
    @client._post @getPath(), buildType, cb

  field: (field, cb) ->
    @client._get @getPath(field), cb

module.exports = ProjectBuildTypes
