export type ApiError = {
  message?: string
  status?: number
}

export type LoginResponse = {
  token: string
} & ApiError

export type Whoami = {
  Name: string
  Email: string
  Avatar: string
  Roles: string[]
}

export type WhoamiResponse = Whoami & ApiError
