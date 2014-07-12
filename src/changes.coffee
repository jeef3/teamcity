module.exports = (client) ->
  (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      client._get '/changes', cb

    else if locator.compile
      client._get '/changes', locator: locator.compile(), cb

    else
      id = locator
      client._get "/changes/#{id}", cb
