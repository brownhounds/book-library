export const enum RequestMethod {
  GET = 'GET',
  PUT = 'PUT',
  POST = 'POST',
  PATCH = 'PATCH'
}

export type ApiError = {
  message?: string
  status?: number
}
