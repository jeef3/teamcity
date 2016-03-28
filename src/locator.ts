export interface ILocator {
  id?: number|string
}

export function compileLocator(locator: ILocator) {
  return Object
    .keys(locator)
    .map(l => {
      if (typeof l === 'number' || typeof l === 'string') {
        return `${l}:${locator[l]}`
      }
    })
    .join(',');
}

export default class Locator<T extends ILocator> {
  store : T = <T>{};
  id: (id: number|string) => this;

  constructor(dimensions?: string[]) {
    dimensions = dimensions || [];
    dimensions.push('id');

    dimensions.forEach(d => {
      this[d] = (v:any) => {
        this.store[d] = v;
        return this;
      }
    });
  }

  fields(fields: string[]): this {
    return this;
  }
}
