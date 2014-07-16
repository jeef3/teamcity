expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
ProjectLocator = require '../src/locators/project-locator'

describe 'API :: Projects', ->
  client = null
  projects = null

  beforeEach ->
    client = new Client()
    projects = require('../src/projects')(client)

  it 'should get the project info', ->
    projects 1, ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/1'

  it 'should get all projects', ->
    projects ->
    expect(client).to.haveCalled 'get', '/app/rest/projects'

  it 'should get projects by project locator', ->
    locator = new ProjectLocator()
      .name 'project-one'

    projects locator, ->
    expect(client).to.haveCalled 'get', '/app/rest/projects', locator: locator.compile()

  it 'should get project (by id) build types', ->
    projects(1).buildTypes ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/1/buildTypes'

  it 'should get project (by locator) build types', ->
    locator = new ProjectLocator()
      .name 'project-one'

    projects(locator).buildTypes ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/name:project-one/buildTypes'

  xit 'should get project (by id) parameters', ->

  it 'should get project (by locator) parameters', ->
    locator = new ProjectLocator()
      .name 'project-one'

    projects(locator).parameters 'param-one', ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/name:project-one/parameters/param-one'
