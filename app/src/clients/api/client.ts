import { API } from '@/config'
import { BaseClient } from '../BaseClient'
import { userSession } from '@/state/UserSession'
import type { BookResponse, BooksResponse } from './types'

export class ApiClient extends BaseClient {
  constructor(baseUrl: string) {
    super(baseUrl)
  }

  public async getBooks(): Promise<BooksResponse> {
    const header = userSession.getBearerToken()
    return this.get<BooksResponse>('/v1/books', {
      headers: {
        ...header
      }
    })
  }

  public async getBookById(id: string): Promise<BookResponse> {
    const header = userSession.getBearerToken()
    return this.get<BookResponse>(`/v1/books/${id}`, {
      headers: {
        ...header
      }
    })
  }
}

export const apiClient = new ApiClient(API.host)
