import test from 'ava';

import MockClient, { IApiCall } from './_client';
import TestLocatable, { ITestLocator, TestLocator } from './_locatable';

// == get()

test('get(id): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const result = await locatable.get('test-id');
  t.is(result.status, 'success', 'should receive result');
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
    t.is(r.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/test-locatable/id:test-id'
      },
      'should get by default id');

    t.end();
  });
});

test('get(object): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = <ITestLocator>{ stringDim: 'some-value' };

  const result = await locatable.get(locator);
  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable/stringDim:some-value'
    },
    'should get by object locator');
});

test.cb('get(object, cb)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = <ITestLocator>{ stringDim: 'some-value' };

  locatable.get(locator, (r: any) => {
    t.is(r.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/test-locatable/stringDim:some-value'
      },
      'should get by object locator');

    t.end();
  });
});

test('get(locator): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  const result = await locatable.get(locator);
  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable/stringDim:another-value'
    },
    'should get by object locator');
});

test.cb('get(locator, cb)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  locatable.get(locator, (r: any) => {
    t.is(r.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/test-locatable/stringDim:another-value'
      },
      'should get by object locator');

    t.end();
  });
});

// == list()

test('list(object): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = <ITestLocator>{ stringDim: 'some-value' };

  const result = await locatable.list(locator);
  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable?locator=stringDim:some-value'
    },
    'should list by object locator');
});

test.cb('list(object, cb)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = <ITestLocator>{ stringDim: 'some-value' };

  locatable.list(locator, (r: any) => {
    t.is(r.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/test-locatable?locator=stringDim:some-value'
      },
      'should list by object locator');

    t.end();
  });
});

test('list(locator): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  const result = await locatable.list(locator);
  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable?locator=stringDim:another-value'
    },
    'should list by object locator');
});

test.cb('list(locator, cb)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  locatable.list(locator, (r: any) => {
    t.is(r.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/test-locatable?locator=stringDim:another-value'
      },
      'should list by object locator');

    t.end();
  });
});

test('by(locator.list(): Promise', async (t) => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  const result = await locatable.by(locator).list();
  t.is(result.status, 'success', 'should receive result');
  t.same(
    client.lastCalled(),
    <IApiCall>{
      verb: 'get',
      path: '/test-locatable?locator=stringDim:another-value'
    },
    'should list by object locator');
});

test.cb('.by(locator).list(cb)', t => {
  const client = new MockClient();
  const locatable = new TestLocatable(client, null, '/test-locatable');

  const locator = new TestLocator()
    .stringDim('another-value');

  locatable.by(locator).list((r: any) => {
    t.is(r.status, 'success', 'should receive result');
    t.same(
      client.lastCalled(),
      <IApiCall>{
        verb: 'get',
        path: '/test-locatable?locator=stringDim:another-value'
      },
      'should list by object locator');

    t.end();
  });
});
