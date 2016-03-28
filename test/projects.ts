import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TeamCity from '../src/index';
import ProjectLocator, { IProjectLocator } from '../src/locators/project-locator';
import BuildTypeLocator from '../src/locators/build-type-locator';

test('buildTypes', t => {
  const client = new MockClient();
  const teamcity = new TeamCity({}, client);

  const projectLocator = new ProjectLocator()
    .name('Project Five')

  const buildTypeLocator = new BuildTypeLocator()
    .name('bt1');

  teamcity
    .projects.by(projectLocator)
    .buildTypes.list(buildTypeLocator);

  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/name:Project Five/buildTypes?locator=name:bt1'
    }
  )
})
