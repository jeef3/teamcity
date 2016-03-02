expect = require('chai').expect

TeamCity = require('../src/teamcity').TeamCity

describe 'TeamCity', ->
  client = null

  beforeEach ->
    client = new TeamCity username: 'test', password: 'password'

  it 'should load', ->
    expect(client.auth.username).to.equal 'test'
    expect(client.auth.password).to.equal 'password'

  it 'should have projects', ->
    expect(client.projects).to.be.a 'object'

  it 'should have buildTypes', ->
    expect(client.buildTypes).to.be.a 'object'

  it 'should have builds', ->
    expect(client.builds).to.be.a 'object'

  it 'should have buildQueue', ->
    expect(client.buildQueue).to.be.a 'function'

  it 'should have changes', ->
    expect(client.changes).to.be.a 'object'

  it 'should have vcsRootInstances', ->
    expect(client.vcsRootInstances).to.be.a 'object'
