import Locatable from './locatable';
import { IClientApi } from './client';
import { IBuildQueueLocator } from './locators/build-queue-locator';
import { IBuild } from './entities';

export default class BuildQueue extends Locatable<IBuildQueueLocator> {

  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path || '/app/rest/buildQueue');
  }

  triggerBuild(build: IBuild, cb?: (r: any) => void): Promise<any> {
    return this.client._post(this.getPath(), build, cb);
  }
}
