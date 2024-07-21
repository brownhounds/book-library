package handlers

import (
	"encoding/json"
	"go-api-template/src/middlewares"
	requests_model "go-api-template/src/models/requests"
	"net/http"

	"github.com/brownhounds/swift/res"
)

type MarkBookingBody struct {
	UserId string
	BookId string
	Date string
}

func RequestBookingHandler(w http.ResponseWriter, r *http.Request) {
	bookId := r.PathValue("bookId")

	userId, ok := middlewares.GetUserIdFromContext(r)
	if !ok {
		res.ApiError(w, http.StatusUnauthorized)
		return
	}

	requestId := requests_model.RequestBooking(userId, bookId)

	res.Json(w, http.StatusOK, res.Map{
		"Id": requestId,
	})
}

func GetActiveBookings(w http.ResponseWriter, r *http.Request) {
	bookings := requests_model.GetActiveBookings()
	res.Json(w, http.StatusOK, bookings)
}

func MarkBookingCollectedHandler(w http.ResponseWriter, r *http.Request) {
	var body MarkBookingBody

	err := json.NewDecoder(r.Body).Decode(&body)
	if err != nil {
		res.ApiError(w, http.StatusBadRequest)
		return
	}

	requestId := r.PathValue("requestId")

	id := requests_model.MarkBookingCollected(body.UserId, body.BookId, requestId, body.Date)

	res.Json(w, http.StatusOK, res.Map{
		"Id": id,
	})
}

func MarkBookingReturnedHandler(w http.ResponseWriter, r *http.Request) {
	var body MarkBookingBody

	err := json.NewDecoder(r.Body).Decode(&body)
	if err != nil {
		res.ApiError(w, http.StatusBadRequest)
		return
	}

	requestId := r.PathValue("requestId")

	id := requests_model.MarkBookingReturned(body.UserId, body.BookId, requestId)

	res.Json(w, http.StatusOK, res.Map{
		"Id": id,
	})
}
