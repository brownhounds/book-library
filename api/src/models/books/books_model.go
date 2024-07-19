package books_model

import (
	"database/sql"
	"errors"
	"go-api-template/src/clients"
	"net/http"
	"time"

	pg "github.com/lib/pq"
)

type BookList struct {
	Id              string         `db:"id"`
	Title           string         `db:"title"`
	Author          string         `db:"author"`
	PublicationYear string         `db:"publication_year"`
	Genres          pg.StringArray `db:"genres"`
}

type Book struct {
	Id              string         `db:"id"`
	Title           string         `db:"title"`
	Author          string         `db:"author"`
	PublicationYear string         `db:"publication_year"`
	Description     string         `db:"description"`
	CoverImage      string         `db:"cover_image"`
	Genres          pg.StringArray `db:"genres"`
	UpdatedAt       time.Time      `db:"updated_at"`
	CreatedAt       time.Time      `db:"created_at"`
}

func GetBooks() *[]BookList {
	conn := clients.Postgres.Connection()
	books := []BookList{}

	err := conn.Select(&books, "SELECT id, title, author, publication_year, genres FROM get_books()")
	if err != nil {
		panic(err)
	}

	return &books
}

func GetBookById(w http.ResponseWriter, bookId string) *Book {
	conn := clients.Postgres.Connection()
	var book Book

	err := conn.Get(&book, "SELECT * FROM get_book_by_id($1)", bookId)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil
		}

		panic(err)
	}

	return &book
}
