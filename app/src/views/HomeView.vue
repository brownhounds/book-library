<script setup lang="ts">
import { onBeforeMount, reactive } from 'vue'
import { apiClient } from '@/clients/api/client'
import type { BookListItem } from '@/clients/api/types'
import { userSession } from '@/state/UserSession'
import { requestBooking } from '@/common/booking'

const state = reactive<{ books: BookListItem[] }>({
  books: []
})

onBeforeMount(async () => {
  state.books = await apiClient.getBooks()
})
</script>

<template>
  <main class="container">
    <h1 class="mt-4 mb-4">Library</h1>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Title</th>
          <th scope="col">Author</th>
          <th scope="col">Publication Year</th>
          <th scope="col">Genres</th>
          <th v-if="!userSession.hasRole('admin')" scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="book in state.books" :key="book.Id">
          <td>
            <RouterLink :to="`/books/${book.Id}`">{{ book.Title }}</RouterLink>
          </td>
          <td>{{ book.Author }}</td>
          <td>{{ book.PublicationYear }}</td>
          <td>
            <span
              class="badge text-bg-secondary"
              style="margin-right: 5px"
              v-for="genre in book.Genres"
              :key="genre"
              >{{ genre }}</span
            >
          </td>
          <td v-if="!userSession.hasRole('admin')">
            <button @click="requestBooking(book.Id)" class="btn btn-primary btn-sm">Request</button>
          </td>
        </tr>
      </tbody>
    </table>
  </main>
</template>
