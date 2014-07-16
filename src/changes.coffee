module.exports = (client) ->
  (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      client._get '/app/rest/changes', cb

    else if locator.compile
      client._get '/app/rest/changes', locator: locator.compile(), cb

    else
      id = locator
      client._get "/app/rest/changes/#{id}", cb
