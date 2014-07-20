expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Changes = require '../src/changes'

describe 'API :: Changes', ->
  client = null
  changes = null

  beforeEach ->
    client = new Client()
    changes = new Changes client

  it 'should get the change info', ->
    changes.get 1, ->
    expect(client).to.haveCalled 'get', '/app/rest/changes/id:1'

  it 'should get all changes', ->
    changes.all ->
    expect(client).to.haveCalled 'get', '/app/rest/changes'

  it 'should get changes by change locator', ->
    changes.by buildType: id: 'bt9', ->
    expect(client).to.haveCalled 'get', '/app/rest/changes/buildType:(id:bt9)'
