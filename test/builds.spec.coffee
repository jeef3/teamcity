expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Builds = require '../src/builds/builds'

describe 'API :: Builds', ->
  client = null
  builds = null

  beforeEach ->
    client = new Client
    builds = new Builds client

  it 'should get the build', ->
    builds.get 1234, ->
    expect(client).to.haveCalled 'get', '/app/rest/builds/id:1234'

  it 'should destroy a build', ->
    builds.get(1234).destroy ->
    expect(client).to.haveCalled 'delete', '/app/rest/builds/id:1234'

  it 'should get all builds', ->
    builds.all ->
    expect(client).to.haveCalled 'get', '/app/rest/builds'

  it 'should get builds by build locator', ->
    builds.by buildType: id: 'bt9', ->
    expect(client).to.haveCalled 'get', '/app/rest/builds?locator=buildType:(id:bt9)'

  it 'should get the build log', ->
    expect(->
      builds.by buiodType: id: 'bt9'
        .buildLog ->
    ).to.throw 'Can only get build log by build id'

    builds.get(1234).buildLog ->
    expect(client).to.haveCalled 'get', '/downloadBuildLog.html', buildId: 1234

  it 'should get build statistics', ->
    builds.get buildType: id: 'bt9'
      .statistics.all ->

    expect(client).to.haveCalled 'get', '/app/rest/builds/buildType:(id:bt9)/statistics'

  it 'should get a build statistic', ->
    builds.get buildType: id: 'bt9'
      .statistics.get 'BuildDuration', ->

    expect(client).to.haveCalled 'get', '/app/rest/builds/buildType:(id:bt9)/statistics/BuildDuration'

    builds.get buildType: id: 'bt9'
      .statistics.BuildDuration ->

    expect(client).to.haveCalled 'get', '/app/rest/builds/buildType:(id:bt9)/statistics/BuildDuration'
