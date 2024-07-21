import type { ApiError } from '../common'

export type BookListItem = {
  Id: string
  Title: string
  Author: string
  PublicationYear: string
  Genres: string[]
}

export type BooksResponse = BookListItem[] & ApiError

export type Book = {
  Id: string
  Title: string
  Author: string
  PublicationYear: string
  Description: string
  CoverImage: string
  Genres: string
  UpdatedAt: string
  CreatedAt: string
}

export type BookResponse = Book & ApiError

export type RequestResponse = { id: string } & ApiError

export type NullableDate = {
  Time: string
  Valid: boolean
}

export type Booking = {
  Id: string
  UserId: string
  UserName: string
  BookId: string
  BookTitle: string
  Status: string
  ReturnDate: NullableDate
  CollectedDate: NullableDate
  ReturnedDate: NullableDate
  CreatedAt: string
  UpdatedAt: string
}

export type BookingsResponse = Booking[] & ApiError

export type Reader = {
  Id: string
  Name: string
  Email: string
  Avatar: string
  CreatedAt: string
}

export type ReadersResponse = Reader[] & ApiError
export type ReaderResponse = Reader & ApiError

export type ReaderBook = Booking
export type ReaderBooksResponse = Booking[] & ApiError
