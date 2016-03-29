import test from 'ava';

import MockClient, { IApiCall } from './_client';
import Builds from '../src/builds';

test('dimensions', t => {
  const builds = new Builds(null);

  t.ok(builds.statistics, 'should have statistics');
  t.ok(builds.buildLog, 'should have buildLog');
});

test('buildLog(): Promise', async (t) => {
  const client = new MockClient();
  const builds = new Builds(client);

  const result = await builds.by({ id: 1 }).buildLog();
  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/app/rest/builds/id:1/downloadBuildLog.html'
    }
  );
})

test.cb('buildLog(cb)', t => {
  const client = new MockClient();
  const builds = new Builds(client);

  builds.by({ id: 1 }).buildLog((result: any) => {
    t.is(result.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/app/rest/builds/id:1/downloadBuildLog.html'
      });

    t.end();
  });
});
