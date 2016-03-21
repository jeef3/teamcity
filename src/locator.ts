export interface LocatorInterface {
  compile: () => string
}

export interface LocatorBaseStore {
  id?: number|string
}

export default class Locator<T extends LocatorBaseStore> implements LocatorInterface {
  protected locators : T

  constructor() {
    this.locators = {};
  }

  id(id: number|string) : this {
    this.locators.id = id;
    return this;
  }

  compile() : string {
    return Object
      .keys(this.locators)
      .map(l => {
        const v = this.locators[l];

        if (typeof l === 'number' || typeof l === 'string') {
          return `${l}:${v}`
        }
      })
      .join('');
  }
}
