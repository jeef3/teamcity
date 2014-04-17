class BuildQueue
  constructor: (@client) ->

  add: (build, cb) ->
    @client._post '/buildQueue', build, cb

module.exports = BuildQueue
