request = require 'request'

Build = require './build'
BuildQueue = require './build-queue'
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
    console.log path
    options =
      method: 'GET'
      url: @_url(path)
      qs: params
      headers:
        'Accept': 'application/json'

    if typeof params is 'function'
      cb = params

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

  build: (id) ->
    new Build id, @

  buildQueue: ->
    new BuildQueue @

  change: (locator) ->
    new Change locator, @

  vcsRootInstance: (id) ->
    new VcsRootInstance id, @

module.exports = Client
