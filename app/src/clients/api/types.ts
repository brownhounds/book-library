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
