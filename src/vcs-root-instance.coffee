class VcsRootInstance
  constructor: (@id, @client) ->

  info: (cb) ->
    @client._get "/vcs-root-instances/#{@id}", null, cb

module.exports = VcsRootInstance
