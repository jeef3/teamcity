Client = require './client'
ProjectLocator = require './locators/project-locator'
ChangesLocator = require './locators/changes-locator'
BuildLocator = require './locators/build-locator'
BuildTypeLocator = require './locators/build-type-locator'

module.exports =
  client: (options) ->
    return new Client options

  projectLocator: ->
    return new ProjectLocator

  changesLocator: ->
    return new ChangesLocator

  buildLocator: ->
    return new BuildLocator

  buildTypeLocator: ->
    return new BuildTypeLocator
