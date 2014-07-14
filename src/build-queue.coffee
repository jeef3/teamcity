module.exports = (client) ->
  buildQueue = (locator, cb) ->
    if !locator and !cb
      return add:  (build, cb) ->
        client._post '/buildQueue', build, cb

    if typeof locator is 'function'
      cb = locator
      client._get '/buildQueue', cb

    else if locator.compile
      client._get '/buildQueue', locator: locator.compile()

    else
      id = locator
      client._get "/buildQueue/taskId:#{id}", cb

  buildQueue
