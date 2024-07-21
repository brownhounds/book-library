<script setup lang="ts">
import { apiClient } from '@/clients/api/client'
import type { Booking } from '@/clients/api/types'
import { isBookOverdue } from '@/common/booking'
import {
  createDateFromStrings,
  formatDateString,
  formatTimeString,
  getHumanDateString,
  getHumanTimeString
} from '@/common/date'
import { onBeforeMount, reactive } from 'vue'

type State = {
  requests: Booking[]
  returnBy: {
    date: string
    time: string
    bookingId: string
    userId: string
    bookId: string
    dateObject: Date
  }
}

const state = reactive<State>({
  requests: [],
  returnBy: {
    bookingId: '',
    date: '',
    time: '',
    userId: '',
    bookId: '',

    get dateObject(): Date {
      return createDateFromStrings(this.date, this.time)
    }
  }
})

const setReturnByState = (bookingId: string, userId: string, bookId: string): void => {
  const now = new Date()
  now.setDate(now.getDate() + 7)

  state.returnBy.date = formatDateString(now)
  state.returnBy.time = formatTimeString(now)
  state.returnBy.bookingId = bookingId
  state.returnBy.userId = userId
  state.returnBy.bookId = bookId
}

const approveRequest = async (): Promise<void> => {
  const { bookId, userId, bookingId, dateObject } = state.returnBy
  await apiClient.approveBooking(bookId, bookingId, userId, dateObject)
  // Just for simplicity refetch the whole list
  void fetchBookings()
}

const returnRequest = async (bookId: string, bookingId: string, userId: string): Promise<void> => {
  await apiClient.returnBooking(bookId, bookingId, userId)
  // Just for simplicity refetch the whole list
  void fetchBookings()
}

const onApproveModalOpen = (bookId: string, bookingId: string, userId: string): void => {
  setReturnByState(bookingId, userId, bookId)
}

const fetchBookings = async (): Promise<void> => {
  state.requests = await apiClient.getBookings()
}

onBeforeMount((): void => {
  void fetchBookings()
})
</script>

<template>
  <main class="container-fluid">
    <h1 class="mt-4 mb-4">Book Requests</h1>
    <div v-if="!state.requests?.length">There is no request at the moment</div>
    <table v-else class="table">
      <thead>
        <tr>
          <th scope="col">User Name</th>
          <th scope="col">Book Title</th>
          <th scope="col">Status</th>
          <th scope="col">Collected At</th>
          <th scope="col">Return By</th>
          <th scope="col">Returned At</th>
          <th scope="col">Requested At</th>
          <th scope="col">Request Updated At</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="req in state.requests" :key="req.Id">
          <td>
            <RouterLink :to="`/readers/${req.UserId}`">{{ req.UserName }}</RouterLink>
          </td>
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
            <span v-if="req.ReturnedDate.Valid">
              {{ getHumanDateString(req.ReturnedDate.Time) }}
              {{ getHumanTimeString(req.ReturnedDate.Time) }}
            </span>
          </td>
          <td>
            <span>
              {{ getHumanDateString(req.CreatedAt) }}
              {{ getHumanTimeString(req.CreatedAt) }}
            </span>
          </td>
          <td>
            <span>
              {{ getHumanDateString(req.UpdatedAt) }}
              {{ getHumanTimeString(req.UpdatedAt) }}
            </span>
          </td>
          <td>
            <button
              @click="onApproveModalOpen(req.BookId, req.Id, req.UserId)"
              v-if="req.Status === 'pending'"
              class="btn btn-success btn-sm"
              data-bs-toggle="modal"
              data-bs-target="#approveRequest"
            >
              Approve
            </button>
            <button
              @click="returnRequest(req.BookId, req.Id, req.UserId)"
              v-if="req.Status === 'collected'"
              class="btn btn-success btn-sm"
            >
              Accept Return
            </button>
          </td>
        </tr>
      </tbody>
    </table>

    <div
      class="modal fade"
      id="approveRequest"
      tabindex="-1"
      aria-labelledby="approveRequestLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="approveRequestLabel">Return Date</h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label for="exampleFormControlInput1" class="form-label">Date</label>
                <input
                  type="date"
                  class="form-control"
                  id="exampleFormControlInput1"
                  v-model="state.returnBy.date"
                />
              </div>
              <div class="col">
                <label for="exampleFormControlInput1" class="form-label">Time</label>
                <input
                  type="time"
                  class="form-control"
                  id="exampleFormControlInput1"
                  v-model="state.returnBy.time"
                />
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button
              @click="approveRequest()"
              type="button"
              data-bs-dismiss="modal"
              class="btn btn-success"
            >
              Approve
            </button>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
