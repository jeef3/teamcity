import { IClientApi } from './client';
import Projects from './projects';

interface Options {
  username?: string,
  password?: string,

  protocol?: string,
  baseUrl?: string
}

export default class TeamCity {
  private auth: Options
  private client: IClientApi

  projects: Projects

  constructor(config?: Options, client?: IClientApi) {
    this.auth = config;
    this.client = client;

    this.projects = new Projects(this.client);
  }
}
