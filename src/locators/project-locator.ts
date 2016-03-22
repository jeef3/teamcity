import { LocatorBuilder, ILocator } from '../locator';

export interface IProjectLocator extends ILocator {
  name?: string
}

export class ProjectLocatorBuilder extends LocatorBuilder<IProjectLocator> {
  name(name: string) : this {
    this.store.name = name;
    return this;
  }
}
