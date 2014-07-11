request = require 'request'

Build = require './build'
BuildTypes = require './build-types'
BuildQueue = require './build-queue'
Projects = require './projects'
Change = require './change'
VcsRootInstance = require './vcs-root-instance'

class Client
  constructor: (options) ->
    if options.username and options.password
      @auth =
        username: options.username
        password: options.password

    @protocol = options.protocol || 'https'
    @baseUrl = options.baseUrl || 'localhost:8080'

  _url: (path) ->
    "#{@protocol}://#{@baseUrl}/app/rest#{path}"

  _attachAuth: (options) ->
    if @auth
      options.auth =
        username: @auth.username
        password: @auth.password
        sendImmediately: true

  _call: (options, cb) ->
    @_attachAuth options
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
    console.log path, params

    options =
      method: 'GET'
      url: @_url(path)
      headers:
        'Accept': 'application/json'

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
      headers:
        'Accept': 'application/json'

    @_call options, cb

  _put: (path, data, cb) ->
    options =
      method: 'PUT'
      url: @_url(path)
      json: data
      headers:
        'Accept': 'application/json'

    @_call options, cb

  projects: new Projects @

  buildTypes: new BuildTypes @

  builds: new Build @

  buildQueue: -> new BuildQueue @

  change: -> new Change @

  vcsRootInstance: -> new VcsRootInstance @

module.exports = Client
