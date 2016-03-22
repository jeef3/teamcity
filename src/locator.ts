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

export default class Locator<T extends ILocator> {
  store : T = <T>{};

  id(id: string) : this {
    this.store.id = id;
    return this;
  }
}
