expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
BuildQueue = require '../src/build-queue'

describe 'API :: Build Queue', ->
  client = null
  buildQueue = null

  beforeEach ->
    client = new Client
    buildQueue = new BuildQueue client

  it 'should get a queded builds info', ->
    buildQueue.get 1, ->
    expect(client).to.haveCalled 'get', '/app/rest/buildQueue/id:1'

  it 'should get all queued builds', ->
    buildQueue.all ->
    expect(client).to.haveCalled 'get', '/app/rest/buildQueue'

  it 'should get queued builds by build queue locator', ->
    buildQueue.by buildType: id: 1234, ->
    expect(client).to.haveCalled 'get', '/app/rest/buildQueue?locator=buildType:(id:1234)'

  it 'should post to the build queue', ->
    build = buildTypeId: 1
    buildQueue.trigger build
    expect(client).to.haveCalled 'post', '/app/rest/buildQueue', build
