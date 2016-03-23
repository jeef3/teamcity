export interface IClientApi {
  _get: (path: string, params?: any, cb?: (result: any) => void) => Promise<any>
  _post: (path: string, params?: any, cb?: (result: any) => void) => Promise<any>
}
