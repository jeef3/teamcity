import Locator, { ILocator } from '../locator';
import BuildTypeLocator from './build-type-locator';
import BuildLocator from './build-locator';
import ProjectLocator from './project-locator';
import VcsRootInstanceLocator from './vcs-root-instance-locator';

export interface IChangesLocator extends ILocator {
  project?: string;
  buildType?: BuildTypeLocator;
  build?: BuildLocator;
  vcsRoot?: any;
  vcsRootInstance: VcsRootInstanceLocator;
  username: string;
  user: string; // UserLocator;
  version: string;
  internalVersion: string;
  comment: string;
  sinceChange: string;

  lookupLimit: number;
  start: number;
  count: number;
}

export default class ChangesLocator extends Locator<IChangesLocator> {
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
