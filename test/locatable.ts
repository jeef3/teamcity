import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TestLocatable, { ITestLocator, TestLocator } from './_locatable';

test('get(id)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  locatable.get('test-id');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable/id:test-id'
    },
    'should get by default id');
});

test.cb('get(id, cb)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  locatable.get('test-id', (r: any) => {
    t.pass('should call the callback');
    t.is(r.status, 'success', 'should receive result');
    t.end();
  });
});

test('get(id): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const result = await locatable.get('test-id');

  t.is(result.status, 'success', 'should receive result');
});

test('get(object)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = <ITestLocator>{ stringDim: 'some-value' };

  locatable.get(locator);
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable/stringDim:some-value'
    },
    'should get by object locator');
});

test('get(locator)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  locatable.get(locator);
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable/stringDim:another-value'
    },
    'should get by object locator');
});

test('list()', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  locatable.get(locator);
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable/stringDim:another-value'
    },
    'should get by object locator');
});
