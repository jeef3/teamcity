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
      obj = JSON.parse body
      cb err, obj

  _get: (path, params, cb) ->
    options =
      method: 'GET'
      url: @_url(path)
      qs: params
      headers:
        'Accept': 'application/json'

    @_call options, cb


  _post: (path, data, cb) ->
    options =
      method: 'POST'
      url: @_url(path)
      form: data
      headers:
        'Accept': 'application/json'

    @_call options, cb

  _put: (path, data, cb) ->
    options =
      method: 'PUT'
      url: @_url(path)
      form: data
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
