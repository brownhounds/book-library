import { apiClient } from '@/clients/api/client'
import type { NullableDate } from '@/clients/api/types'
import router from '@/router'
import { userSession } from '@/state/UserSession'

export const requestBooking = async (bookId: string): Promise<void> => {
  await apiClient.requestBooking(bookId)
  router.push({ path: `/readers/${userSession.user?.Id}` })
}

export const isBookOverdue = (date: NullableDate): boolean => {
  return date.Valid && new Date(date.Time) < new Date()
}
