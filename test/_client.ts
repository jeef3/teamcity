import { IClientApi } from '../src/client';

export interface IApiCall {
  verb: string
  path: string
  data?: any
}

export default class MockClient implements IClientApi {
  _lastCalled: IApiCall

  lastCalled() : IApiCall {
    return this._lastCalled;
  }

  _get(path, params, cb) {
    this._lastCalled = {
      verb: 'get',
      path: path
    };

    if (typeof params !== 'function') {
      this._lastCalled.data = params;
    }
  }

  _post(path, params, cb) {
    this._lastCalled = {
      verb: 'get',
      path: path,
      data: params
    }
  }
}
