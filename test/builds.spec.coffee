expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
BuildLocator = require '../src/locators/build-locator'

describe 'API :: Builds', ->
  client = null
  builds = null

  beforeEach ->
    client = new Client()
    builds = require('../src/builds')(client)

  it 'should be able to get the build info', ->
    builds(1)
    expect(client).to.haveCalled 'get', '/builds/1'

  it 'should be able to get all builds', ->
    builds ->
    expect(client).to.haveCalled 'get', '/builds'

  it 'should be able to get builds by build locator', ->
    locator = new BuildLocator()
      .buildType id: 1234

    builds(locator)
    expect(client).to.haveCalled 'get', '/builds?locator=buildType:(id:1234)'
