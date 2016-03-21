import { ClientInterface } from './client';
import { LocatorInterface } from './locator';

export default class Locatable<T extends LocatorInterface> {

  // parent: Locatable

  private _client: ClientInterface
  private _path: string
  private _defaultLocator: T

  private _locator: T

  constructor(
      client: ClientInterface,
      path: string,
      defaultLocator: { new(): T; }) {
    this._client = client
    this._path = path;

    this._defaultLocator = new defaultLocator();
  }

  get(locator: number|string|T, cb?: () => void) {
    if (typeof locator === 'string') {
      this._locator = this._defaultLocator;
      this._locator.id(locator);
    }
    return this._client._get(this._getPath(), cb);
  }

  protected _getPath(child?, list?) : string {
    const parts = [];

    if (this.parent) {
      parts.push(this.parent.getPath());
    }

    parts.push(this._path);

    if (this._locator) {
      if (list) {
        parts.push(`?locator=${this._locator.compile()}`);
      } else {
        parts.push(`/${this._locator.compile()}`);
      }
    }

    if (child) {
      parts.push(`/${child}`);
    }

    return parts.join('');
  }
}
