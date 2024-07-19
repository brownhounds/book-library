<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import { computed } from 'vue'
import router from './router'

const showHeader = computed(() => router.currentRoute.value.name != 'login')
</script>

<template>
  <header v-if="showHeader">
    <div class="wrapper">
      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/logout">Logout</RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>
