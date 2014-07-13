module.exports = (client) ->
  (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      client._get '/buildTypes', cb

    else if locator.compile
      client._get '/buildTypes', locator: locator.compile(), cb

    else
      id = locator
      client._get "/buildTypes/#{id}", cb
