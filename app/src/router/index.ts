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
      path: '/books/:id',
      name: 'book',
      beforeEnter: [AuthMiddleware],
      component: () => import('../views/BookItem.vue')
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
      path: '/user/books',
      name: 'user-books',
      beforeEnter: [AuthMiddleware],
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/admin/requests',
      name: 'book-requests',
      beforeEnter: [AuthMiddleware, RoleMiddleware('admin')],
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/admin/readers',
      name: 'readers',
      beforeEnter: [AuthMiddleware, RoleMiddleware('admin')],
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/admin/readers/:id',
      name: 'reader',
      beforeEnter: [AuthMiddleware, RoleMiddleware('admin')],
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'not-found',
      component: () => import('../views/NotFoundView.vue')
    }
  ]
})

router.isReady().then(() => {
  void userSession.fetchUserDetails()
})

export default router
