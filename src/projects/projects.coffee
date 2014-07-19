Locatable = require '../locatable'
ProjectLocator = require '../locators/project-locator'
ProjectParameters = require './project-parameters'
ProjectBuildTypes = require './project-build-types'

class Projects extends Locatable
  @path '/app/rest/projects'
  @locator ProjectLocator

  constructor: (@client) ->
    super @client, null

    Object.defineProperty @,
      'parameters',
      get: -> new ProjectParameters @client, @

    Object.defineProperty @,
      'buildTypes',
      get: ->
        new ProjectBuildTypes @client, @

    # Object.defineProperty @,
    #   'templates',
    #   get: -> new ProjectTemplates @client, @

  create: (project, cb) ->
    @client._post @getPath(), project, cb

  delete: (cb) ->
    @client._delete @getPath(), cb

  field: (field, cb) ->
    @client._get @getPath(field), cb

module.exports = Projects
