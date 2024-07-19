import { API } from '@/config'
import { BaseClient } from '../BaseClient'
import type { LoginResponse, WhoamiResponse } from './types'
import { userSession } from '@/state/UserSession'

export class AuthClient extends BaseClient {
  constructor(baseUrl: string) {
    super(baseUrl)
  }

  public async logIn(body: { email: string; password: string }): Promise<LoginResponse> {
    return this.post<LoginResponse>('/v1/auth/login', {
      body
    })
  }

  public async whoami(): Promise<WhoamiResponse> {
    const header = userSession.getBearerToken()
    return this.get<WhoamiResponse>('/v1/auth/whoami', {
      headers: {
        ...header
      }
    })
  }
}

export const authClient = new AuthClient(API.host)
