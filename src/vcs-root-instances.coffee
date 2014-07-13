module.exports = (client) ->
  (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      client._get '/vcs-root-instances', cb

    else if locator.compile
      client._get '/vcs-root-instances', locator: locator.compile(), cb

    else
      id = locator
      client._get "/vcs-root-instances/#{id}", cb
