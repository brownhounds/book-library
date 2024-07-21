<script setup lang="ts">
import { onBeforeMount, reactive } from 'vue'
import { apiClient } from '@/clients/api/client'
import type { Reader } from '@/clients/api/types'
import { getHumanDateString } from '@/common/date'

const state = reactive<{ readers: Reader[] }>({
  readers: []
})

onBeforeMount(async () => {
  state.readers = await apiClient.getReaders()
})
</script>

<template>
  <main class="container">
    <h1 class="mt-4 mb-4">Readers</h1>
    <div v-if="!state.readers?.length">There is no readers</div>
    <table v-else class="table">
      <thead>
        <tr>
          <th scope="col">Name</th>
          <th scope="col">Email</th>
          <th scope="col">Joined At</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="reader in state.readers" :key="reader.Id">
          <td>
            <RouterLink :to="`/readers/${reader.Id}`">{{ reader.Name }}</RouterLink>
          </td>
          <td>{{ reader.Email }}</td>
          <td>{{ getHumanDateString(reader.CreatedAt) }}</td>
        </tr>
      </tbody>
    </table>
  </main>
</template>
