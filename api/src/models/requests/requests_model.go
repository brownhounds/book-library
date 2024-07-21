package requests_model

import (
	"go-api-template/src/clients"
	"go-api-template/src/models"
	"time"
)

type BookingId struct {
	Id string `db:"id"`
}

func RequestBooking(userId, bookId string) string {
	conn := clients.Postgres.Connection()

	var booking BookingId

	err := conn.Get(&booking, "SELECT request_booking($1, $2) as id", userId, bookId)
	if err != nil {
		panic(err)
	}

	return booking.Id
}

func MarkBookingCollected(userId, bookId, requestId, returnDate string) string {
	conn := clients.Postgres.Connection()

	var booking BookingId

	date, err := time.Parse(time.RFC3339, returnDate)
	if err != nil {
		panic(err)
	}

	{
		err := conn.Get(
			&booking,
			"SELECT mark_booking_collected($1, $2, $3, $4) as id",
			userId,
			bookId,
			requestId,
			date,
		)

		if err != nil {
			panic(err)
		}
	}

	return booking.Id
}

func MarkBookingReturned(userId, bookId, requestId string) string {
	conn := clients.Postgres.Connection()

	var booking BookingId

	err := conn.Get(&booking, "SELECT mark_booking_return($1, $2, $3) as id", userId, bookId, requestId)
	if err != nil {
		panic(err)
	}

	return booking.Id
}

func GetActiveBookings() *[]models.Booking {
	conn := clients.Postgres.Connection()

	var bookings []models.Booking

	err := conn.Select(&bookings, "SELECT * FROM get_active_bookings()")
	if err != nil {
		panic(err)
	}

	return &bookings
}
