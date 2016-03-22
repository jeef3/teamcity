import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TeamCity from '../src/index';
import { ProjectLocatorBuilder, IProjectLocator } from '../src/locators/project-locator';

test('get (string)', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  teamcity.projects.get('Project One', () => {});
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/id:Project One'
    },
    'should get a project');
});

test('get (locator)', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  const locator = <IProjectLocator>{ name: 'Project Three' };

  teamcity.projects.get(locator, () => {});
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/name:Project Three'
    },
    'should get a project');
});

test('all', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  teamcity.projects.all();
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects'
    }
  );
});

test('field', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  teamcity.projects
    .by({ name: 'Project Four' })
    .field('field-one');

  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/name:Project Four/field-one'
    }
  );
});

test('buildTypes', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  teamcity.projects
    .by({ name: 'Project Five' })
    .buildTypes.all();

  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/name:Project Five/buildTypes'
    }
  )
})
