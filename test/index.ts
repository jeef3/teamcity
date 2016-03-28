import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TeamCity from '../src/index';
import ProjectLocator from '../src/locators/project-locator';
import BuildLocator from '../src/locators/build-locator';
import BuildTypeLocator from '../src/locators/build-type-locator';
import { BuildTypeFields } from '../src/build-types';
import { BuildFields, BuildStatus } from '../src/builds';

test('TeamCity :: auth', (t) => {
  const teamcity = new TeamCity({
    username: 'test',
    password: 'password'
  });

  t.pass();
});

test('Advanced locators', async (t) => {
  const client = new MockClient();
  const teamcity = new TeamCity({
    username: 'test',
    password: 'password'
  }, client);

  const projectLocator = new ProjectLocator()
    .id('project1');

  const buildLocator = new BuildLocator()
    .status(BuildStatus.FAILURE)
    .fields([
      BuildFields.ID,
      BuildFields.NUMBER,
      BuildFields.STATUS
    ]);

  const buildTypeLocator = new BuildTypeLocator()
    .paused(true)
    .fields([
      BuildTypeFields.ID,
      BuildTypeFields.PROJECT
    ]);

  const result = await teamcity
    .projects.by(projectLocator)
    .buildTypes.by(buildTypeLocator)
    .list();

  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/projects/id:project1/buildTypes/?locator=paused:true&fields=buildType(id,project,builds($locator(status:failure),build(id,number,status)))'
    },
    'should list by object locator');
});

