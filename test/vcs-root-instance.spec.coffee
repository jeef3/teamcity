expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
VcsRootInstance = require '../src/vcs-root-instance'

describe 'VCS Root Instance', ->
  client = null
  vcsRootInstance = null

  beforeEach ->
    client = new Client
    vcsRootInstance = new VcsRootInstance 1, client

  it 'should be able to get the VCS root instance info', ->
    vcsRootInstance.info()
    expect(client).to.haveCalled 'get', '/vcs-root-instances/1'
