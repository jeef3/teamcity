import Locatable from './locatable';
import { IClientApi } from './client';
import { IChangesLocator } from './locators/changes-locator';

export default class Changes extends Locatable<IChangesLocator> {
  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path || '/app/rest/changes');
  }
}
