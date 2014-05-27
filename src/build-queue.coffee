class BuildQueue
  constructor: (@client) ->

  add: (build, cb) ->
    @client._post '/buildQueue', build, cb

  findTask: (taskId, cb) ->
    @client._get "/buildQueue/taskId:#{taskId}", null, cb

module.exports = BuildQueue
