<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView } from 'vue-router'
import UserAvatar from '@/components/UserAvatar.vue'
import router from './router'
import { userSession } from './state/UserSession'

const showHeader = computed(
  () => !['login', 'not-found'].includes(String(router.currentRoute.value.name))
)
</script>

<template>
  <header v-if="showHeader">
    <nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
      <div class="container-fluid">
        <RouterLink class="navbar-brand" to="/">World Of Books</RouterLink>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <RouterLink class="nav-link" to="/">Home</RouterLink>
            </li>
            <li v-if="!userSession.hasRole('admin')" class="nav-item">
              <RouterLink class="nav-link" :to="`/readers/${userSession.user?.Id}`"
                >My Books</RouterLink
              >
            </li>
            <li class="nav-item" v-if="userSession.hasRole('admin')">
              <RouterLink class="nav-link" to="/admin/requests">Requests</RouterLink>
            </li>
            <li class="nav-item" v-if="userSession.hasRole('admin')">
              <RouterLink class="nav-link" to="/admin/readers">Readers</RouterLink>
            </li>
          </ul>
          <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <span v-if="userSession.hasRole('admin')" class="badge text-bg-secondary me-3"
                  >Admin</span
                >
                <UserAvatar class="me-2" :user="userSession.user" :size="36" />
                {{ userSession.user?.Name }}
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li v-if="!userSession.hasRole('admin')">
                  <RouterLink class="dropdown-item" :to="`/readers/${userSession.user?.Id}`"
                    >My Books</RouterLink
                  >
                </li>
                <li v-if="!userSession.hasRole('admin')"><hr class="dropdown-divider" /></li>
                <li>
                  <RouterLink class="dropdown-item" to="/logout">Logout</RouterLink>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <RouterView />
</template>
