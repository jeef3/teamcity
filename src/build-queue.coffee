module.exports = (client) ->
  buildQueue = (locator, cb) ->
    if !locator and !cb
      return add:  (build, cb) ->
        client._post '/app/rest/buildQueue', build, cb

    if typeof locator is 'function'
      cb = locator
      client._get '/app/rest/buildQueue', cb

    else if locator.compile
      client._get '/app/rest/buildQueue', locator: locator.compile()

    else
      id = locator
      client._get "/app/rest/buildQueue/taskId:#{id}", cb

  buildQueue
