import Locatable from './locatable';
import { IClientApi } from './client';
import { IBuildTypeLocator } from './locators/build-type-locator';

export default class Temlpates extends Locatable<IBuildTypeLocator> {
  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path || '/app/rest/buildTypes');

    // TODO: Set templateFlag: true?
  }
}
