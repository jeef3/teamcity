import { IClientApi } from '../src/client';
import Locator, { ILocator } from '../src/locator';
import Locatable from '../src/locatable';

export interface ITestLocator extends ILocator {
  booleanDim: boolean
  numberDim: number
  stringDim: string
}

export class TestLocator extends Locator<ITestLocator> {
  booleanDim(booleanDim: boolean) : this {
    this.store.booleanDim = booleanDim;
    return this;
  }

  numberDim(numberDim: number) : this {
    this.store.numberDim = numberDim;
    return this;
  }

  stringDim(stringDim: string) : this {
    this.store.stringDim = stringDim;
    return this;
  }
}

export default class TestLocatable extends Locatable<ITestLocator> {
  constructor(client: IClientApi, parent?: Locatable<any>, path?: string) {
    super(client, parent, path);
  }
}

