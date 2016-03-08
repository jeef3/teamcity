expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
BuildTypes = require '../src/build-types'

describe 'API :: Build Types', ->
  client = null
  buildTypes = null

  beforeEach ->
    client = new Client
    buildTypes = new BuildTypes client

  it 'should get the build type info', ->
    buildTypes.get 1, ->
    expect(client).to.haveCalled 'get', '/app/rest/buildTypes/id:1'


  it 'should get all build types', ->
    buildTypes.all ->
    expect(client).to.haveCalled 'get', '/app/rest/buildTypes'

  it 'should get build types by build type locator', ->
    buildTypes.by affectedProject: id: 1234, ->
    expect(client).to.haveCalled 'get', '/app/rest/buildTypes?locator=affectedProject:(id:1234)'


