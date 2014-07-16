expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Builds = require '../src/builds'
BuildLocator = require '../src/locators/build-locator'

describe 'API :: Builds', ->
  client = null
  builds = null

  beforeEach ->
    client = new Client
    builds = new Builds client

  it 'should get the build info', ->
    builds.get 1234, ->
    expect(client).to.haveCalled 'get', '/app/rest/builds/1234'

  it 'should get all builds', ->
    builds.all ->
    expect(client).to.haveCalled 'get', '/app/rest/builds'

  it 'should get builds by build locator', ->
    builds.by
      .buildType(id: 'bt9')
      .locate ->

    expect(client).to.haveCalled 'get', '/app/rest/builds/buildType:(id:bt9)'

  it 'should get the build log', ->
    expect(->
      builds.by
        .buildType(id: 'bt9')
        .locate()
        .buildLog ->
    ).to.throw 'Can only get build log by build id'

    builds.get(1234).buildLog ->
    expect(client).to.haveCalled 'get', '/downloadBuildLog.html', buildId: 1234

  it 'should get build statistics', ->
    builds.by
      .buildType(id: 'bt9')
      .locate()
      .statistics ->

    expect(client).to.haveCalled 'get', '/app/rest/builds/buildType:(id:bt9)/statistics'
