import Locator, { ILocator } from '../locator';

export interface IBuildTypeLocator extends ILocator {
  name?: string
  internalId?: string
  project?: string
  affectedProject?: string
  template?: string
  templateFlag?: string
  paused?: boolean
}

export default class BuildTypeLocator extends Locator<IBuildTypeLocator> {
  name: (name: string) => this;
  internalId: (string) => this;
  project: (string) => this;
  affectedProject: (string) => this;
  template: (string) => this;
  templateFlag: (string) => this;
  paused: (boolean) => this;

  constructor() {
    super([
      'name',
      'internalId',
      'project',
      'affectedProject',
      'template',
      'templateFlag',
      'paused'
    ]);
  }
}
