import { ClientInterface } from './client';

export default class Locatable {
  client: ClientInterface

  constructor(client: ClientInterface) {
    this.client = client
  }

  getPath(t?:any) : string {
    return '/';
  }

  get(locator: string, cb?: () => void) {
    return this.client._get(this.getPath(), cb);
  }
}
