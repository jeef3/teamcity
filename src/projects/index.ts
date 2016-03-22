import { IClientApi } from '../client';
import Locatable from '../locatable';
import { IProjectLocator } from '../locators/project-locator';

export default class Projects extends Locatable<IProjectLocator> {

  constructor(client: IClientApi) {
    super(client, '/app/rest/projects');
  }

  parameters = {}

  create(project: any, cb?: () => void) {
    return this.client._post(this.getPath(), project, cb);
  }

  // TODO: Not sure about this
  destroy(cb) {}

  field(field: any, cb?: () => void) {
    return this.client._get(this.getPath(field), cb);
  }
}
