<script setup lang="ts">
import type { Whoami } from '@/clients/auth/types'

const { user } = defineProps<{ user?: Whoami; size: number }>()
</script>

<template>
  <img :style="{ maxWidth: `${size}px` }" :src="user?.Avatar" :alt="user?.Name" />
</template>

<style scoped lang="scss">
img {
  height: auto;
  border-radius: 50%;
}
</style>
