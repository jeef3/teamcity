import Locator, { ILocator } from '../locator';
import BuildTypeLocator from './build-locator';

export interface IBuildQueueLocator extends ILocator {
  project?: string
  buildType?: BuildTypeLocator
}

export default class BuildQueueLocator extends Locator<IBuildQueueLocator> {
  project: (string) => this;
  buildType: (BuildTypeLocator) => this;

  constructor() {
    super([
      'project',
      'buildType'
    ]);
  }
}
