expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
VcsRootInstances = require '../src/vcs-root-instances'

describe 'API :: VCS Root Instances', ->
  client = null
  vcsRootInstances = null

  beforeEach ->
    client = new Client
    vcsRootInstances = new VcsRootInstances client

  it 'should get the VCS root instance', ->
    vcsRootInstances.get 1, ->
    expect(client).to.haveCalled 'get', '/app/rest/vcs-root-instances/id:1'

  it 'should get all VCS root instances', ->
    vcsRootInstances.all ->
    expect(client).to.haveCalled 'get', '/app/rest/vcs-root-instances'
