Locatable = require './locatable'
ProjectLocator = require './locators/project-locator'

class Projects extends Locatable
  @path '/app/rest/projects'

  constructor: (@client) ->
    super @client, new ProjectLocator

  delete: ->
    @locatorNeeded()
    @client._delete @located()

  parameters: ->
    @locatorNeeded()
    new ProjectParameters @client

  buildTypes: ->
    @locatorNeeded()
    new ProjectBuildTypes @client

  templates: ->
    @locatorNeeded()
    new ProjectTemplates @client, @
