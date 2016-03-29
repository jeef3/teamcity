import { IClientApi } from './client';
import Locator, { ILocator, compileLocator } from './locator';

export default class Locatable<T extends ILocator> {

  protected client: IClientApi

  private _parent: Locatable<any>
  private _path: string

  private _locator: T

  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    this.client = client
    this._parent = parent;
    this._path = path;

    this._locator = <T>{};
  }

  /*
   * Get one item, always takes a locator.
   */
  get(locator: number|string|T|Locator<any>, cb?: (r:any) => void): Promise<any> {
    this._setLocator(locator);

    return this.client._get(this.getPath(), cb);
  }

  /**
   * List items by given or previously set locator
   */
  list(locator?: any, cb?: (r: any[]) => void): Promise<any> {
    if (typeof locator === 'function') {
      cb = locator;
      locator = null;
    }

    if (locator) {
      this._setLocator(locator);
    }

    return this.client._get(this.getPath(null, true), cb);
  }

  /*
   * Get all items (resets the current locator)
   */
  all(cb?: (r: any) => void) {
    this._locator = <T>{};
    return this.client._get(this.getPath(), cb);
  }

  /*
   * Set the current locator
   */
  by(locator: number|string|T|Locator<any>) : this {
    this._setLocator(locator);

    return this;
  }

  protected getPath(child?, list?) : string {
    const parts = [];

    if (this._parent) {
      parts.push(this._parent.getPath());
    }

    parts.push(this._path);

    if (this._locator) {
      let compiled = compileLocator(this._locator);

      if (compiled) {
        if (list) {
          parts.push(`?locator=${compiled}`);
        } else {
          parts.push(`/${compiled}`);
        }
      }
    }

    if (child) {
      parts.push(`/${child}`);
    }

    return parts.join('');
  }

  private _setLocator(locator: number|string|T|Locator<any>) {
    if (locator instanceof Locator) {
      this._locator = locator.store;
    } else if (typeof locator === 'number' || typeof locator === 'string') {
      this._locator.id = locator;
    } else if (typeof locator === 'object') {
      this._locator = locator;
    }
  }
}