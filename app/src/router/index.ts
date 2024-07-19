import { createRouter, createWebHistory } from 'vue-router'
import { AuthMiddleware, RoleMiddleware } from './middlewares'
import { userSession } from '@/state/UserSession'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      beforeEnter: [AuthMiddleware],
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/login',
      name: 'login',
      beforeEnter: [AuthMiddleware],
      component: () => import('../views/LoginView.vue')
    },
    {
      path: '/logout',
      name: 'logout',
      beforeEnter: [async () => await userSession.logOut()],
      component: () => import('../views/LogoutView.vue')
    },
    {
      path: '/about',
      name: 'about',
      beforeEnter: [AuthMiddleware, RoleMiddleware('test')],
      component: () => import('../views/HomeView.vue')
    }
  ]
})

export default router
