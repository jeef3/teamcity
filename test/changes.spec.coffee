expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
ChangeLocator = require '../src/locators/change-locator'

describe 'API :: Changes', ->
  client = null
  changes = null

  beforeEach ->
    client = new Client()
    changes = require('../src/changes')(client)

  it 'should get the change info', ->
    changes(1)
    expect(client).to.haveCalled 'get', '/app/rest/changes/1'

  it 'should get all changes', ->
    changes ->
    expect(client).to.haveCalled 'get', '/app/rest/changes'

  it 'should get changes by change locator', ->
    locator = new ChangeLocator()
      .buildType id: 1234

    changes(locator)
    expect(client).to.haveCalled 'get', '/app/rest/changes', locator: locator.compile()
