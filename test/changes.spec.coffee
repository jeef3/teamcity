expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Changes = require '../src/changes'
BuildLocator = require '../src/locators/build-locator'

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
    locator = new BuildLocator()
    locator.buildType id: 'bt9'

    changes.by locator, ->
    expect(client).to.haveCalled 'get', '/app/rest/changes?locator=buildType:(id:bt9)'
