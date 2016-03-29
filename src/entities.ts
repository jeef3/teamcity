export interface IComment {
  text: string;
}

export interface IBuild {
  buildTypeId: number|string;
  agentId: number|string;
  comment: IComment
}

export interface IBuildType {

}
