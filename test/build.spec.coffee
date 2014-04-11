expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Build = require '../src/build'

describe 'Build', ->
  client = null
  build = null

  beforeEach ->
    client = new Client
    build = new Build 1, client

  it 'should be able to get the build info', ->
    build.info()
    expect(client).to.haveCalled 'get', '/builds/1'
