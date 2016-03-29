import Locator, { ILocator } from '../locator';

export interface IProjectLocator extends ILocator {
  name?: string
}

export default class ProjectLocator extends Locator<IProjectLocator> {
  name: (name: string) => this;

  // TODO: Disallow use of id AND name

  constructor() {
    super([ 'name' ]);
  }
}