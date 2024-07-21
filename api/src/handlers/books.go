package handlers

import (
	books_model "go-api-template/src/models/books"
	"net/http"

	"github.com/brownhounds/swift/res"
)

func GetBooksHandler(w http.ResponseWriter, r *http.Request) {
	books := books_model.GetBooks()
	res.Json(w, http.StatusOK, books)
}

func GetBookByIdHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("bookId")
	book := books_model.GetBookById(w, id)
	if book == nil {
		res.ApiError(w, http.StatusNotFound)
		return
	}
	res.Json(w, http.StatusOK, book)
}
