<script setup lang="ts">
import { onBeforeMount, reactive } from 'vue'
import { useRoute } from 'vue-router'
import { apiClient } from '@/clients/api/client'
import type { Book } from '@/clients/api/types'
import { requestBooking } from '@/common/booking'
import { userSession } from '@/state/UserSession'
import { getHumanDateString } from '@/common/date'

const state = reactive<{ book?: Book }>({
  book: undefined
})

const route = useRoute()

onBeforeMount(async () => {
  const id = route.params.id as string
  state.book = await apiClient.getBookById(id)
})
</script>

<template>
  <main v-if="state.book" class="container">
    <div class="mt-4 mb-4 d-flex align-items-center">
      <h1 class="me-4">
        {{ state.book?.Title }}
      </h1>
      <button
        v-if="!userSession.hasRole('admin')"
        @click="requestBooking(state.book.Id)"
        class="btn btn-primary btn-sm"
      >
        Request Book
      </button>
    </div>
    <div class="d-flex book-container">
      <div class="cover">
        <img :src="state.book.CoverImage" :alt="state.book.Title" />
      </div>
      <div class="book-details">
        <div class="mb-3">
          <h3>Description</h3>
          <p>{{ state.book.Description }}</p>
        </div>
        <div class="mb-3">
          <h3>Author</h3>
          <p>{{ state.book.Author }}</p>
        </div>
        <div class="mb-3">
          <h3>Publication Year</h3>
          <p>{{ state.book.PublicationYear }}</p>
        </div>
        <div class="mb-3">
          <h3>Added To Our Library</h3>
          <p>{{ getHumanDateString(state.book.CreatedAt) }}</p>
        </div>
        <div class="mb-3">
          <h3>Genres</h3>
          <ul>
            <li v-for="genre in state.book.Genres" :key="genre">
              {{ genre }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </main>
</template>

<style scoped lang="scss">
.book-container {
  column-gap: 2rem;
  .cover img {
    max-width: 20rem;
    height: auto;
  }
}
</style>
