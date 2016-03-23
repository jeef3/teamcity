import { IClientApi } from '../src/client';

export interface IApiCall {
  verb: string
  path: string
  data?: any
}

export default class MockClient implements IClientApi {
  private _lastCalled: IApiCall

  lastCalled() : IApiCall {
    return this._lastCalled;
  }

  _get(path: string, params?: any, cb?: (result: any) => void): Promise<any> {
    if (typeof params === 'function') {
      cb = params;
      params = null;
    }

    this._lastCalled = {
      verb: 'get',
      path: path
    };

    if (params) {
      this._lastCalled.data = params;
    }

    const result = { status: 'success' };

    if (cb) { cb(result); }

    return new Promise((resolve, reject) => {
      resolve(result);
    });
  }

  _post(path: string, params?: any, cb?: (result: any) => void): Promise<any> {
    if (typeof params === 'function') {
      cb = params;
      params = null;
    }

    this._lastCalled = {
      verb: 'get',
      path: path,
      data: params
    }

    if (params) {
      this._lastCalled.data = params;
    }

    const result = { status: 'success' };

    if (cb) { cb(result); }

    return new Promise((resolve, reject) => {
      resolve(result);
    });
  }
}
