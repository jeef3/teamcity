export interface ILocator {
  id?: number|string
}

export function compileLocator(locator: ILocator) {
  return Object
    .keys(locator)
    .map(l => {
      const v = locator[l];

      if (typeof l === 'number' || typeof l === 'string') {
        return `${l}:${v}`
      }
    })
    .join('');
}

export class LocatorBuilder<T extends ILocator> {
  protected store : T

  constructor() {
    this.store = <T>{};
  }

  id(id: number|string) : this {
    this.store.id = id;
    return this;
  }

  build() : T {
    return this.store;
  }
}
