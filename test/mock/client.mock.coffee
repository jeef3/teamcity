class Client

  _get: (path, params, cb) ->
    @calledVerb = 'get'
    @calledPath = path
    @calledData = params

  _post: (path, data, cb) ->
    @calledVerb = 'post'
    @calledPath = path
    @calledData = data

  _put: (path, data, cb) ->
    @calledVerb = 'put'
    @calledPath = path
    @calledData = data

  verb: -> @calledVerb
  path: -> @calledPath
  data: -> @calledData

module.exports = Client
