expect = require('chai').expect
require './have-called'

TeamCity = require('../src/teamcity').TeamCity

describe 'Changes', ->

  beforeEach ->
    teamCity = new TamCity()

  it 'should be able to get a change by id', ->
    change = new Change 14800, client
    change.info()
    expect(client).to.haveCalled 'get', '/changes/14800'

    change = new Change '14800', client
    change.info()
    expect(client).to.haveCalled 'get', '/changes/14800'

  it 'should require a change id to get the info', ->
    change = new Change locator: 'build:(id:4252)', client
    expect(->
      change.info()
    ).to.throw()

  it 'should be able to query for changes by build', ->
    change = new Change locator: 'build:(id:4252)', client
    change.query()
    expect(client).to.haveCalled 'get', '/changes', change.locator

  it 'should be able to query for changes by id', ->
    change = new Change 14800, client
    change.query()
    expect(client).to.haveCalled 'get', '/changes/14800'
