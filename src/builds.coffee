module.exports = (client) ->
  (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      client._get '/app/rest/builds', cb

    else if locator.compile
      client._get '/app/rest/builds', locator: locator.compile(), cb

    else
      id = locator
      client._get "/app/rest/builds/#{id}", cb
