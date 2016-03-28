import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TeamCity from '../src/index';

test('TeamCity :: auth', (t) => {
  const teamcity = new TeamCity({
    username: 'test',
    password: 'password'
  });

  t.pass();
});
