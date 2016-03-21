import { ClientInterface } from '../src/client';

interface ApiCall {
  verb: string
  path: string
  data?: any
}

export default class Client implements ClientInterface {
  _lastCalled: ApiCall

  lastCalled() : ApiCall {
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
