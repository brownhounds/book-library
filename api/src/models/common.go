package models

import (
	"database/sql"
	"time"
)

type Booking struct {
	Id            string       `db:"id"`
	UserId        string       `db:"user_id"`
	UserName      string       `db:"user_name"`
	BookId        string       `db:"book_id"`
	BookTitle     string       `db:"book_title"`
	Status        string       `db:"status"`
	ReturnDate    sql.NullTime `db:"return_date"`
	CollectedDate sql.NullTime `db:"collected_date"`
	ReturnedDate  sql.NullTime `db:"returned_date"`
	CreatedAt     time.Time    `db:"created_at"`
	UpdatedAt     time.Time    `db:"updated_at"`
}
