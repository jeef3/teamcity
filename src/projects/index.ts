import { ClientInterface } from '../client';
import Locatable from '../locatable';

export default class Projects extends Locatable {

  constructor(client: ClientInterface) {
    super(client);
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
