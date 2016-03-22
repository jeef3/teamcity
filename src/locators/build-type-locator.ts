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
  name(name: string) : this {
    this.store.name = name;
    return this;
  }

  internalId(internalId: string) : this {
    this.store.internalId = internalId;
    return this;
  }

  project(project: string) : this {
    this.store.project = project;
    return this;
  }
}
