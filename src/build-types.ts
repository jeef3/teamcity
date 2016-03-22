import { IClientApi } from './client';
import Locatable from './locatable';
import { IBuildTypeLocator } from './locators/build-type-locator';

export default class BuildTypes extends Locatable<IBuildTypeLocator> {

  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path || '/app/rest/buildTypes');
  }
}
