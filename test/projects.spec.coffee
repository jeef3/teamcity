expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Projects = require '../src/projects'

describe 'API :: Projects', ->
  client = null
  projects = null

  beforeEach ->
    client = new Client()
    projects = new Projects client
  # "/{projectLocator}/templates"
  # "/{projectLocator}/buildTypes/{btLocator}/builds"
  # "/{projectLocator}/buildTypes/{btLocator}/builds/{buildLocator}"
  # "/{projectLocator}/{field}"
  # "/{projectLocator}/buildTypes/{btLocator}"
  # "/{projectLocator}/templates/{btLocator}"
  # "/{projectLocator}/buildTypes/{btLocator}/{field}"

  it 'should get the project', ->
    projects.get 'project-one', ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/id:project-one'

  it 'should delete the project', ->
    projects.delete 'project-one', ->
    expect(client).to.haveCalled 'delete', '/app/rest/projects/id:project-one'

  it 'should create a project', ->
    projectData = {}
    projects.create projectData, ->
    expect(client).to.haveCalled 'post', '/app/rest/projects', projectData

  # "/{projectLocator}"
  it 'should get all projects', ->
    projects.all ->
    expect(client).to.haveCalled 'get', '/app/rest/projects'

  # "/{projectLocator}"
  it 'should get projects by project locator', ->
    projects.by name: 'Project One', ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One'

  it 'should get project fields', ->
    projects.by name: 'Project One'
      .field 'field-one', ->

  describe 'buildTypes', ->
    # "/{projectLocator}/buildTypes"
    it 'should get project, build types', ->
      projects.by name: 'Project One'
        .buildTypes.all ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes'

    # "/{projectLocator}/buildTypes/{btLocator}/builds/{buildLocator}/{field}"
    it 'should get a projects, build types, builds, field', ->
      projects.by name: 'Project One'
        .buildTypes.by id: 'bt9'
        .builds.by user: id: 1
        .startDate ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9/builds/user:(id:1)/startDate'

  describe 'parameters', ->
    # "/{projectLocator}/parameters"
    it 'should get project, parameters', ->
      projects.by name: 'Project One'
        .parameters.all ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/parameters'

    # "/{projectLocator}/parameters/{name}"
    it 'should get project, parameters parameter', ->
      projects.by name: 'Project One'
        .parameters.get 'param-one', ->


      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/parameters/param-one'

    # "/{projectLocator}/parameters/{name}"
    it 'should set project parameters parameter', ->
      projects.by name: 'Project One'
        .parameters.set 'param-one', 'param-one-value', ->

      expect(client).to.haveCalled 'post', '/app/rest/projects/name:Project One/parameters/param-one', 'param-one-value'

