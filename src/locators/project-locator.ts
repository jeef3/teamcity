import Locator, { LocatorBaseStore } from '../locator';

interface ProjectLocatorStore extends LocatorBaseStore {
  name?: string
}

export default class ProjectLocator extends Locator<ProjectLocatorStore> {
  name(name: string) : this {
    this.locators.name = name;
    return this;
  }
}
