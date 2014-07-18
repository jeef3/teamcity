Locatable = require './locatable'
ProjectLocator = require './locators/project-locator'

class Projects extends Locatable
  @path '/app/rest/projects'

  constructor: (@client) ->
    super @client, null, ProjectLocator

  create: (project, cb) ->
    @client._post '/app/rest/projects', project, cb

  delete: ->
    @client._delete @getPath()

  parameters: ->
    new ProjectParameters @client, @

  buildTypes: ->
    new ProjectBuildTypes @client, @

  templates: ->
    new ProjectTemplates @client, @
