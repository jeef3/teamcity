module.exports = (client) ->
  childGetter = (locator) ->
    identifier = if locator.compile then locator.compile() else locator

    buildTypes: (cb) ->
      client._get "/app/rest/projects/#{identifier}/buildTypes", cb
    templates: (cb) ->
      client._get "/app/rest/projects/#{identifier}/templates", cb
    parameters: (param, cb) ->
      client._get "/app/rest/projects/#{identifier}/parameters/#{param}", cb


  getProject = (locator, cb) ->
    if locator.compile
      client._get '/app/rest/projects', locator: locator.compile()
    else
      id = locator
      client._get "/app/rest/projects/#{id}", cb

  projects = (locator, cb) ->
    if typeof locator is 'function'
      cb = locator
      return client._get '/app/rest/projects', cb

    if cb and typeof cb is 'function'
      getProject locator, cb
    else
      childGetter locator

  projects
