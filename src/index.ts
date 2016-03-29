import { IClientApi } from './client';
import Builds from './builds';
import BuildTypes from './build-types';
import BuildQueue from './build-queue';
import Changes from './changes';
import Projects from './projects';
import VcsRootInstances from './vcs-root-instances';

interface Options {
  username?: string,
  password?: string,

  protocol?: string,
  baseUrl?: string
}

export default class TeamCity {
  private auth: Options
  private client: IClientApi

  builds: Builds;
  buildTypes: BuildTypes;
  buildQueue: BuildQueue;
  changes: Changes;
  projects: Projects;
  vcsRootInstances: VcsRootInstances;

  constructor(config?: Options, client?: IClientApi) {
    this.auth = config;
    this.client = client;

    this.builds = new Builds(this.client);
    this.buildTypes = new BuildTypes(this.client);
    this.buildQueue = new BuildQueue(this.client);
    this.projects = new Projects(this.client);
    this.vcsRootInstances = new VcsRootInstances(this.client);
  }
}
