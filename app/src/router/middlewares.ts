import type { RouteLocationNormalized } from 'vue-router'
import router from '.'
import { userSession } from '@/state/UserSession'

export const AuthMiddleware = (
  to: RouteLocationNormalized,
  from: RouteLocationNormalized,
  next: Function
): void => {
  const isLoggedIn = userSession.loggedIn

  if (isLoggedIn && to.name === 'login') {
    router.push({ path: '/', replace: true })
  } else if (!isLoggedIn && to.name !== 'login') {
    router.push({ path: '/login', replace: true })
  } else {
    next()
  }
}

export const RoleMiddleware = (role: string): (() => void) => {
  return async (): Promise<void> => {
    await userSession.fetchUserDetails()
    if (!userSession.hasRole(role)) {
      router.push({ path: '/', replace: true })
    }
  }
}
