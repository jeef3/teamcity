expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'

describe 'Build', ->
  builds = null

  beforeEach ->
    builds = require('../src/builds')(client)

  it 'should be able to get the build info', ->
    builds(1)
    expect(client).to.haveCalled 'get', '/builds/1'

  it 'should be able to get all builds', ->
    builds ->
    expect(client).to.haveCalled 'get', '/builds'
