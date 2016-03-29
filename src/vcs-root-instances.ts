import Locatable from './locatable';
import { IClientApi } from './client';
import { IVcsRootInstanceLocator } from './locators/vcs-root-instance-locator';
import BuildTypes from './build-types';

export default class Projects extends Locatable<IVcsRootInstanceLocator> {
  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path || '/app/rest/vcs-root-instances');
  }
}
