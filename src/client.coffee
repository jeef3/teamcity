request = require 'request'

class Client
  constructor: (options) ->
    if options.username and options.password
      @auth =
        username: options.username
        password: option.password

    @protocol = options.protocol || 'https'
    @baseUrl = options.baseUrl || 'localhost:8080'

  _url: (path) ->
    "#{@protocol}://#{@baseUrl}/app/rest#{path}"

  _get: (path, params, cb) ->
    request
      method: 'GET'
      url: @_url(path)
      qs: params
      headers:
        'Accept': 'application/json'
      ,
      cb

  _post: (path, data, cb) ->
    request
      method: 'POST'
      url: @_url(path)
      form: data
      headers:
        'Accept': 'application/json'
      ,
      cb

  _put: (path, data, cb) ->
    request
      method: 'PUT'
      url: @_url(path)
      form: data
      headers:
        'Accept': 'application/json'
      ,
      cb

  build: (id) ->
    new Build id, @

  vcsRootInstance: (id) ->
    new VcsRootInstance id, @


module.exports = Client
