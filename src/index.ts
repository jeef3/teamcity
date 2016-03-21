import { ClientInterface } from './client';
import Projects from './projects';

interface Options {
  username?: string,
  password?: string,

  protocol?: string,
  baseUrl?: string
}

export default class TeamCity {
  private auth: Options
  private client: ClientInterface

  constructor(config?: Options, client?: ClientInterface) {
    this.auth = config;
    this.client = client;
  }

  projects = new Projects(this.client);
}
