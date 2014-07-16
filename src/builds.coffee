module.exports = (client) ->
  children = (locator) ->
    buildLog: (cb) ->
      if locator.compile
        throw new Error 'Can only get build log by id'
      else
        client._get '/downloadBuildLog.html', buildId: locator

  build = (locator, cb) ->
    if locator.compile
      client._get '/app/rest/builds', locator: locator.compile(), cb
    else
      id = locator
      client._get "/app/rest/builds/#{id}", cb

  builds = (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      return client._get '/app/rest/builds', cb

    if cb and typeof cb is 'function'
      build locator, cb
    else
      children locator

  builds
