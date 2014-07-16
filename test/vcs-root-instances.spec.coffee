expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'

describe 'API :: VCS Root Instances', ->
  client = null
  vcsRootInstance = null

  beforeEach ->
    client = new Client
    vcsRootInstance = require('../src/vcs-root-instances')(client)

  it 'should get the VCS root instance info', ->
    vcsRootInstance 1
    expect(client).to.haveCalled 'get', '/app/rest/vcs-root-instances/1'

  it 'should get all VCS root instances', ->
    vcsRootInstance ->
    expect(client).to.haveCalled 'get', '/app/rest/vcs-root-instances'
