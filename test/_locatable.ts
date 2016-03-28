import { IClientApi } from '../src/client';
import Locator, { ILocator } from '../src/locator';
import Locatable from '../src/locatable';

export interface ITestLocator extends ILocator {
  booleanDim: boolean
  numberDim: number
  stringDim: string
}

export class TestLocator extends Locator<ITestLocator> {

  booleanDim: (booleanDim: boolean) => this;
  numberDim: (numberDim: number) => this;
  stringDim: (stringDim: string) => this;

  constructor() {
    super(['booleanDim', 'numberDim', 'stringDim']);
  }
}

export default class TestLocatable extends Locatable<ITestLocator> {
  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path);
  }
}

