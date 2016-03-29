import Locatable from './locatable';
import { IClientApi } from './client';
import { IBuildLocator } from './locators/build-locator';
import BuildStatistics from './build-statistics';

export default class Builds extends Locatable<IBuildLocator> {

  statistics: BuildStatistics;

  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path || '/app/rest/builds');

    this.statistics = new BuildStatistics();
  }

  buildLog(cb?: (r:any) => void) {
    return this.client._get(this.getPath('downloadBuildLog.html'), cb);
  }
}
