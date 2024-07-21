package readers_model

import (
	"database/sql"
	"errors"
	"go-api-template/src/clients"
	"go-api-template/src/models"
	"time"
)

type Reader struct {
	Id        string    `db:"id"`
	Name      string    `db:"name"`
	Email     string    `db:"email"`
	Avatar    string    `db:"avatar"`
	CreatedAt time.Time `db:"created_at"`
}

func GetReaders() *[]Reader {
	conn := clients.Postgres.Connection()

	readers := []Reader{}

	err := conn.Select(&readers, "SELECT * FROM get_readers()")
	if err != nil {
		panic(err)
	}

	return &readers
}

func GetReaderById(readerId string) *Reader {
	conn := clients.Postgres.Connection()
	var reader Reader

	err := conn.Get(&reader, "SELECT * FROM get_reader_by_id($1)", readerId)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil
		}

		panic(err)
	}

	return &reader
}

func GetBooksByReaderId(readerId string) *[]models.Booking {
	conn := clients.Postgres.Connection()

	books := []models.Booking{}

	err := conn.Select(&books, "SELECT * FROM get_books_by_user_id($1)", readerId)
	if err != nil {
		panic(err)
	}

	return &books
}
