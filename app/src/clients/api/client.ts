import { API } from '@/config'
import { BaseClient } from '../BaseClient'
import { userSession } from '@/state/UserSession'
import type {
  BookingsResponse,
  BookResponse,
  BooksResponse,
  ReaderBooksResponse,
  ReaderResponse,
  ReadersResponse,
  RequestResponse
} from './types'

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

  public async getBookings(): Promise<BookingsResponse> {
    const header = userSession.getBearerToken()
    return this.get<BookingsResponse>(`/v1/books/requests`, {
      headers: {
        ...header
      }
    })
  }

  public async requestBooking(bookId: string): Promise<RequestResponse> {
    const header = userSession.getBearerToken()
    return this.post<RequestResponse>(`/v1/books/${bookId}/requests`, {
      headers: {
        ...header
      }
    })
  }

  public async approveBooking(
    bookId: string,
    bookingId: string,
    userId: string,
    date: Date
  ): Promise<RequestResponse> {
    const header = userSession.getBearerToken()
    return this.patch<RequestResponse>(`/v1/books/requests/${bookingId}/approve`, {
      headers: {
        ...header
      },
      body: {
        userId,
        bookId,
        date
      }
    })
  }

  public async returnBooking(
    bookId: string,
    bookingId: string,
    userId: string
  ): Promise<RequestResponse> {
    const header = userSession.getBearerToken()
    return this.patch<RequestResponse>(`/v1/books/requests/${bookingId}/return`, {
      headers: {
        ...header
      },
      body: {
        userId,
        bookId
      }
    })
  }

  public async getReaders(): Promise<ReadersResponse> {
    const header = userSession.getBearerToken()
    return this.get<ReadersResponse>(`/v1/readers`, {
      headers: {
        ...header
      }
    })
  }

  public async getReaderById(readerId: string): Promise<ReaderResponse> {
    const header = userSession.getBearerToken()
    return this.get<ReaderResponse>(`/v1/readers/${readerId}`, {
      headers: {
        ...header
      }
    })
  }

  public async getBooksByReaderId(readerId: string): Promise<ReaderBooksResponse> {
    const header = userSession.getBearerToken()
    return this.get<ReaderBooksResponse>(`/v1/readers/${readerId}/books`, {
      headers: {
        ...header
      }
    })
  }
}

export const apiClient = new ApiClient(API.host)
