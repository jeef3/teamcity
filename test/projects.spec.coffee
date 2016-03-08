expect = require('chai').expect
require './have-called'

Client = require './mock/client.mock'
Projects = require '../src/projects/projects'

describe 'API :: Projects', ->
  client = null
  projects = null

  beforeEach ->
    client = new Client()
    projects = new Projects client

  it 'should get the project', ->
    projects.get 'Project One', ->
    expect(client).to.haveCalled 'get', '/app/rest/projects/id:Project One'

  it 'should destroy the project', ->
    projects.get('Project One').destroy ->
    expect(client).to.haveCalled 'delete', '/app/rest/projects/id:Project One'

  it 'should create a project', ->
    projectData = {}
    projects.create projectData, ->
    expect(client).to.haveCalled 'post', '/app/rest/projects', projectData

  it 'should get all projects', ->
    projects.all ->
    expect(client).to.haveCalled 'get', '/app/rest/projects'

  it 'should get projects by project locator', ->
    projects.by name: 'Project One', ->
    expect(client).to.haveCalled 'get', '/app/rest/projects?locator=name:Project One'

  describe 'field', ->
    it 'should get project fields', ->
      projects.get name: 'Project One'
        .field 'field-one', ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/field-one'

  describe 'buildTypes', ->
    it 'should get build types', ->
      projects.get name: 'Project One'
        .buildTypes.all ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes'

    it 'should get build types by locator', ->
      projects.get name: 'Project One'
        .buildTypes.get id: 'bt9', ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9'

    describe 'field', ->
      it 'should get buildTypes field', ->
        projects.by name: 'Project One'
          .buildTypes.by id: 'bt9'
          .field 'field-one', ->

        expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9/field-one'

    describe 'builds', ->
      it 'should get builds', ->
        projects.by name: 'Project One'
          .buildTypes.by id: 'bt9'
          .builds.all ->

        expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9/builds'

      it 'should get builds by locator', ->
        projects.get name: 'Project One'
          .buildTypes.get id: 'bt9'
          .builds.by user: id: 1, ->

        expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9/builds?locator=user:(id:1)'

      describe 'field', ->
        it 'should get the field', ->
          projects.get name: 'Project One'
            .buildTypes.get id: 'bt9'
            .builds.get user: id: 1
            .startDate ->

          expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9/builds/user:(id:1)/startDate'

          projects.get name: 'Project One'
            .buildTypes.get id: 'bt9'
            .builds.get user: id: 1
            .field 'field-one', ->

          expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/buildTypes/id:bt9/builds/user:(id:1)/field-one'

  describe 'parameters', ->
    it 'should get parameters', ->
      projects.get name: 'Project One'
        .parameters.all ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/parameters'

    it 'should get parameters parameter', ->
      projects.get name: 'Project One'
        .parameters.get 'param-one', ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/parameters/param-one'

    it 'should set parameters parameter', ->
      projects.get name: 'Project One'
        .parameters.set 'param-one', 'param-one-value', ->

      expect(client).to.haveCalled 'post', '/app/rest/projects/name:Project One/parameters/param-one', 'param-one-value'

  describe 'templates', ->
    it 'should get templates', ->
      projects.get name: 'Project One'
        .templates.all ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/templates'

    it 'should get templates by build locator', ->
      projects.get name: 'Project One'
        .templates.get id: 'bt9', ->

      expect(client).to.haveCalled 'get', '/app/rest/projects/name:Project One/templates/id:bt9'
