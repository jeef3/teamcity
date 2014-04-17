expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
BuildQueue = require '../src/build-queue'

describe 'Build Queue', ->
  client = null
  buildQueue = null

  beforeEach ->
    client = new Client
    buildQueue = new BuildQueue client

  it 'should be able to post to the build queue', ->
    build = buildTypeId: 1
    buildQueue.add build
    expect(client).to.haveCalled 'post', '/buildQueue', build
