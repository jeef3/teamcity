import Locator, { ILocator } from '../locator';
import BuildTypeLocator from './build-type-locator';
import ProjectLocator from './project-locator';

export interface IBuildLocator extends ILocator {
  name?: string;
  buildType?: BuildTypeLocator;
  tags?: string[],
  status?: any; /* SUCCESS || FAILURE || ERROR */
  user?: any; // UserLocator
  personal?: any; // true || false || any
  canceled?: any; // true || false || any
  failedToStart?: any; // true || false || any
  running?: any; // true || false || any
  pinned?: any; // true || false || any

  branch?: any; // BranchLocator

  agentName?: string;
  sinceBuild?: BuildLocator;
  sinceDate?: Date;
  project?: ProjectLocator;

  count?: number;
  start?: number;
  lookUpLimit?: number;
}

export default class BuildLocator extends Locator<IBuildLocator> {
  name: (name: string) => this;
  buildType: (buildTypeLocator: BuildTypeLocator) => this;
  tags: (tags: string[]) => this;
  status: (status: any) => this;

  constructor() {
    super([
      'name',
      'buildType',
      'tags',
      'status',
      'user',
      'personal',
      'canceled',
      'failedToStart',
      'running',
      'pinned',

      'branch',

      'agentName',
      'sinceBuild',
      'sinceDate',
      'project',

      'count',
      'start',
      'lookUpLimit'
    ]);
  }
}
