import { ClientInterface } from '../client';
import Locatable from '../locatable';
import ProjectLocator from '../locators/project-locator';

export default class Projects extends Locatable<ProjectLocator> {

  constructor(client: ClientInterface) {
    super(client, '/app/rest/projects', ProjectLocator);
  }

  parameters = {}

  create(project: any, cb?: () => void) {
    return this.client._post(this._getPath(), project, cb);
  }

  // TODO: Not sure about this
  destroy(cb) {}

  field(field: any, cb?: () => void) {
    return this.client._get(this._getPath(field), cb);
  }
}
