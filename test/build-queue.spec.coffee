expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
BuildQueueLocator = require '../src/locators/build-queue-locator'

describe 'API :: Build Queue', ->
  client = null
  buildQueue = null

  beforeEach ->
    client = new Client
    buildQueue = require('../src/build-queue')(client)

  it 'should get a queded builds info', ->
    buildQueue 1
    expect(client).to.haveCalled 'get', '/app/rest/buildQueue/taskId:1'

  it 'should get all queued builds', ->
    buildQueue ->
    expect(client).to.haveCalled 'get', '/app/rest/buildQueue'

  it 'should get queued builds by build queue locator', ->
    locator = new BuildQueueLocator()
      .buildType id: 1234

    buildQueue locator
    expect(client).to.haveCalled 'get', '/app/rest/buildQueue', locator: locator.compile()

  it 'should post to the build queue', ->
    build = buildTypeId: 1
    buildQueue().add build
    expect(client).to.haveCalled 'post', '/app/rest/buildQueue', build
