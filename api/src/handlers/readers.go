package handlers

import (
	"go-api-template/src/middlewares"
	readers_model "go-api-template/src/models/readers"
	"net/http"

	"github.com/brownhounds/swift/res"
)

func GetReaders(w http.ResponseWriter, r *http.Request) {
	readers := readers_model.GetReaders()
	res.Json(w, http.StatusOK, readers)
}

func GetReaderById(w http.ResponseWriter, r *http.Request) {
	readerId := r.PathValue("readerId")

	currentUser, ok := middlewares.GetUserIdFromContext(r)
	if !ok {
		res.ApiError(w, http.StatusForbidden)
		return
	}

	if !middlewares.IsUserAdmin(r) && readerId != currentUser {
		res.ApiError(w, http.StatusForbidden)
		return
	}

	reader := readers_model.GetReaderById(readerId)
	res.Json(w, http.StatusOK, reader)
}

func GetBooksByReaderId(w http.ResponseWriter, r *http.Request) {
	readerId := r.PathValue("readerId")

	currentUser, ok := middlewares.GetUserIdFromContext(r)
	if !ok {
		res.ApiError(w, http.StatusForbidden)
		return
	}

	if !middlewares.IsUserAdmin(r) && readerId != currentUser {
		res.ApiError(w, http.StatusForbidden)
		return
	}

	books := readers_model.GetBooksByReaderId(readerId)
	res.Json(w, http.StatusOK, books)
}
