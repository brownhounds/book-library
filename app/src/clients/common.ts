export enum RequestMethod {
  GET = 'GET',
  PUT = 'PUT',
  POST = 'POST'
}

export type ApiError = {
  message?: string
  status?: number
}
