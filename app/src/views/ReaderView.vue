<script setup lang="ts">
import { onBeforeMount, reactive } from 'vue'
import { useRoute } from 'vue-router'
import { apiClient } from '@/clients/api/client'
import type { Reader, ReaderBook } from '@/clients/api/types'
import { isBookOverdue } from '@/common/booking'
import { getHumanDateString, getHumanTimeString } from '@/common/date'
import { userSession } from '@/state/UserSession'

const state = reactive<{ reader?: Reader; books: ReaderBook[] }>({
  reader: undefined,
  books: []
})

const route = useRoute()

onBeforeMount(async (): Promise<void> => {
  const id = route.params.id as string
  state.reader = await apiClient.getReaderById(id)
  state.books = await apiClient.getBooksByReaderId(id)
})
</script>

<template>
  <main class="container">
    <h1 class="mt-4 mb-4">
      {{ state.reader?.Name }}
    </h1>
    <div v-if="state.reader" class="d-flex align-items-center reader-container mb-4">
      <div class="avatar">
        <img :src="state.reader.Avatar" :alt="state.reader.Name" />
      </div>
      <div class="book-details">
        <div class="mb-2"><b>Email: </b> {{ state.reader.Email }}</div>
        <div>
          <b>Joined At: </b> {{ getHumanDateString(state.reader.CreatedAt) }}
          {{ getHumanTimeString(state.reader.CreatedAt) }}
        </div>
      </div>
    </div>
    <h2>Reader Books</h2>
    <div v-if="!state.books?.length">
      <span v-if="userSession.hasRole('admin')"
        ><b>{{ state.reader?.Name }}</b> has no books or requests.</span
      >
      <span v-else>You don't have any books or requests.</span>
    </div>
    <table v-else class="table">
      <thead>
        <tr>
          <th scope="col">Book Title</th>
          <th scope="col">Status</th>
          <th scope="col">Collected At</th>
          <th scope="col">Return By</th>
          <th scope="col">Requested At</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="req in state.books" :key="req.Id">
          <td>
            <RouterLink :to="`/books/${req.BookId}`">{{ req.BookTitle }}</RouterLink>
          </td>
          <td>
            <span v-if="isBookOverdue(req.ReturnDate)" class="badge text-bg-danger">Overdue</span>
            <span v-else-if="req.Status === 'pending'" class="badge text-bg-secondary"
              >Requested</span
            >
            <span v-else-if="req.Status === 'collected'" class="badge text-bg-warning"
              >In Reader Hands</span
            >
          </td>
          <td>
            <span v-if="req.CollectedDate.Valid">
              {{ getHumanDateString(req.CollectedDate.Time) }}
              {{ getHumanTimeString(req.CollectedDate.Time) }}
            </span>
          </td>
          <td>
            <span v-if="req.ReturnDate.Valid">
              {{ getHumanDateString(req.ReturnDate.Time) }}
              {{ getHumanTimeString(req.ReturnDate.Time) }}
            </span>
          </td>
          <td>
            <span>
              {{ getHumanDateString(req.CreatedAt) }}
              {{ getHumanTimeString(req.CreatedAt) }}
            </span>
          </td>
        </tr>
      </tbody>
    </table>
  </main>
</template>

<style scoped lang="scss">
.reader-container {
  column-gap: 2rem;
  .avatar {
    min-width: 5rem;
    min-height: 5rem;

    img {
      max-width: 5rem;
      border-radius: 50%;
      height: auto;
    }
  }
}
</style>
