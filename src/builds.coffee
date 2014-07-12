module.exports = (client) ->
  (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      client._get '/builds', cb

    else if locator.compile
      console.log 'was locator', locator
      client._get '/builds', locator: locator.compile(), cb

    else
      id = locator
      client._get "/builds/#{id}", cb
