request = require 'request'

ProjectLocator = require './locators/project-locator'
ChangesLocator = require './locators/changes-locator'
BuildLocator = require './locators/build-locator'
BuildTypeLocator = require './locators/build-type-locator'
BuildQueueLocator = require './locators/build-queue-locator'

class TeamCity
  constructor: (options) ->
    options = options || {}

    if options.username and options.password
      @auth =
        username: options.username
        password: options.password

    @protocol = options.protocol || 'https'
    @baseUrl = options.baseUrl || 'localhost:8080'


  # API

  projects: (locator, cb) ->
    require('./projects')(@)(locator, cb)

  buildTypes: (locator, cb) ->
    require('./build-types')(@)(locator, cb)

  builds: (locator, cb) ->
    require('./builds')(@)(locator, cb)

  buildQueue: (locator, cb) ->
    require('./build-queue')(@)(locator, cb)

  changes: (locator, cb) ->
    require('./changes')(@)(locator, cb)

  vcsRootInstances: (locator, cb) ->
    require('./vcs-root-instances')(@)(locator, cb)


  # Locators

  projectLocator: ->
    return new ProjectLocator

  changesLocator: ->
    return new ChangesLocator

  buildLocator: ->
    return new BuildLocator

  buildTypeLocator: ->
    return new BuildTypeLocator

  buildQueueLocator: ->
    return new BuildQueueLocator


  # URL Helpers

  _url: (path) ->
    "#{@protocol}://#{@baseUrl}#{path}"

  _attachAuth: (options) ->
    return unless @auth

    if @auth
      options.auth =
        username: @auth.username
        password: @auth.password
        sendImmediately: true

  _call: (options, cb) ->
    @_attachAuth options

    options.headers =
        'Accept': 'application/json'

    request options, (err, response, body) ->
      return unless cb

      if err
        cb err

      if typeof body is 'string'
        try
          data = JSON.parse body
        catch error
          err = body
      else
        data = body

      cb err, data

  _get: (path, params, cb) ->
    options =
      method: 'GET'
      url: @_url(path)

    if typeof params is 'function'
      cb = params
    else
      options.qs = params

    @_call options, cb


  _post: (path, data, cb) ->
    options =
      method: 'POST'
      url: @_url(path)
      json: data

    @_call options, cb

  _put: (path, data, cb) ->
    options =
      method: 'PUT'
      url: @_url(path)
      json: data

    @_call options, cb

module.exports.TeamCity = TeamCity
