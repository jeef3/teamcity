ProjectLocator = require './locators/project-locator'

class Projects
  constructor: (@client) ->
    @locator = ProjectLocator

  get: (id, cb) ->
    @locate new ProjectLocator().id(id), cb

  all: (cb) ->
    @client._get '/projects', cb

  locate: (locator, cb) ->
    if !locator.compile
      locator = new ProjectLocator(locator)

    if cb
      @client._get '/projects', locate: locator.compile(), cb
    else
      @locator = locator
      this


  buildTypes:
    all: (cb) ->
      @client._get "/projects/#{@locator.compile()}/buildTypes", cb

  templates:
    all: (cb) ->
      @client._get "/projects/#{@locator.compile()}/templates", cb

module.exports = Projects
