import { IClientApi } from './client';
import { ILocator, compileLocator } from './locator';

export default class Locatable<T extends ILocator> {

  protected client: IClientApi

  private _path: string

  private _locator: T
  private _parent: Locatable<any>

  constructor(client: IClientApi, path: string) {
    this.client = client
    this._path = path;

    this._locator = <T>{};
  }

  get(locator: number|string|T, cb?: () => void) {
    if (typeof locator === 'number' || typeof locator === 'string') {
      this._locator.id = locator;
    } else if (typeof locator === 'object') {
      this._locator = locator;
    }

    console.log('get', this._locator)

    return this.client._get(this.getPath(), cb);
  }

  protected getPath(child?, list?) : string {
    const parts = [];

    if (this._parent) {
      parts.push(this._parent.getPath());
    }

    parts.push(this._path);

    if (this._locator) {
      let compiled = compileLocator(this._locator);
      if (list) {
        parts.push(`?locator=${compiled}`);
      } else {
        parts.push(`/${compiled}`);
      }
    }

    if (child) {
      parts.push(`/${child}`);
    }

    return parts.join('');
  }
}
