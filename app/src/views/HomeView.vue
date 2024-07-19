<script setup lang="ts">
import { apiClient } from '@/clients/api/client'
import type { BookListItem } from '@/clients/api/types'
import { onBeforeMount, reactive } from 'vue'

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
          <th scope="col">Availability</th>
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
          <td>Unknown</td>
        </tr>
      </tbody>
    </table>
  </main>
</template>
