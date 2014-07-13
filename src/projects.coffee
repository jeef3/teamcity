module.exports = (client) ->
  childGetter = (locator) ->
    identifier = if locator.compile then locator.compile() else locator

    buildTypes: (cb) ->
      client._get "/projects/#{identifier}/buildTypes", cb
    templates: (cb) ->
      client._get "/projects/#{identifier}/templates", cb


  getProject = (locator, cb) ->
    if locator.compile
      client._get '/projects', locator: locator.compile()
    else
      id = locator
      client._get "/projects/#{id}", cb

  projects = (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      return client._get '/projects', cb

    if cb and typeof cb is 'function'
      getProject locator, cb
    else
      childGetter locator

  projects
