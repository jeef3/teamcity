import request from 'request';

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
  private client: IClientApi

  builds: Builds;
  buildTypes: BuildTypes;
  buildQueue: BuildQueue;
  changes: Changes;
  projects: Projects;
  vcsRootInstances: VcsRootInstances;

  constructor(options?: Options, client?: IClientApi) {
    this.client = client || new Client(options);

    this.builds = new Builds(this.client);
    this.buildTypes = new BuildTypes(this.client);
    this.buildQueue = new BuildQueue(this.client);
    this.projects = new Projects(this.client);
    this.vcsRootInstances = new VcsRootInstances(this.client);
  }
}

function url(path, options) {
  return `${options.protocol}://${options.baseUrl}${path}`;
}

class Client implements IClientApi {
  private options: Options;

  constructor(options: Options) {
    this.options = options;
  }

  _call(options: any, cb?: (err: any, data?: any) => void): Promise<any> {
    const opts = Object.assign(
      {},
      options,
      {
        auth: {
          username: this.options.username,
          password: this.options.password,
          sendImmediately: true
        }
      }, {
        headers: {
          'Accept': 'application/json'
        }
      }
    );

    request(options, (err, response, body) => {
      return new Promise((resolve, reject) => {
        if (err) {
          if (cb) { cb(err); }
          reject(err);
          return;
        }

        let data;

        if (typeof body === 'string') {
          try {
            data = JSON.parse(body);
          } catch (error) {
            err = body;
          }
        } else {
          data = body;
        }

        if (cb) {
          cb(err, data);
        }

        if (err) {
          reject(err);
        } else {
          resolve(data);
        }
      });
    });
  }

  _get(path: string, params?: any, cb?: (result: any) => void): Promise<any> {

  }

  _post(path: string, params?: any, cb?: (result: any) => void): Promise<any> {

  }
}
