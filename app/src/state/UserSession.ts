import { apiClient } from '@/clients/api/client'
import type { Whoami } from '@/clients/api/types'
import router from '@/router'
import { reactive } from 'vue'

export type AuthorizationHeader = {
  Authorization: string
}

class UserSession {
  public user?: Whoami

  public loggedIn = false

  constructor() {
    this.loggedIn = Boolean(localStorage.getItem('token'))
  }

  public async fetchUserDetails(): Promise<void> {
    if (this.loggedIn && !this.user) {
      const res = await apiClient.whoami()

      if (!res.status) {
        this.user = res
      }
    }
  }

  public async postLogin(token: string) {
    this.storeToken(token)
    await this.fetchUserDetails()

    router.push({ path: '/' })
  }

  public hasRole(role: string): boolean {
    return Boolean(this.user?.Roles.find((r) => r === role))
  }

  public getBearerToken = (): AuthorizationHeader => {
    return {
      Authorization: `Bearer ${localStorage.getItem('token') || ''}`
    }
  }

  public logOut = async (): Promise<void> => {
    localStorage.removeItem('token')
    this.loggedIn = false
    this.user = undefined
    await this.delay(100)
    router.push({ path: '/login', replace: true })
  }

  private delay(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms))
  }

  private storeToken(token: string) {
    // This is a big NO, NO!! Just for the sake of exercise!
    // Never store JWT in browser APIs that
    // are available from JS level, this is considered
    // as big security risk.
    localStorage.setItem('token', token)
    this.loggedIn = true
  }
}

export const userSession = reactive(new UserSession())
;(window as any).session = userSession
