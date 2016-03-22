import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TeamCity from '../src/index';
import { ProjectLocatorBuilder, IProjectLocator } from '../src/locators/project-locator';

test('Projects :: get', t => {
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

test('Projects :: get (locator)', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  const locator = new ProjectLocatorBuilder()
    .name('Project Two')
    .build();

  teamcity.projects.get(locator, () => {});
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/name:Project Two'
    },
    'should get a project');
});

test('Projects :: get (object)', t => {
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
