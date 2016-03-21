import test from 'ava';

import TeamCity from '../src/index';
import Client from './_client';

test('Projects', t => {
  const client = new Client();
  const teamcity = new TeamCity({}, client);

  teamcity.projects.get('Project One', () => {});
  t.same(
    client.lastCalled(),
    {
      verb: 'get',
      path: '/app/rest/projects/id:Project One'
    },
    'should get a project');
});
