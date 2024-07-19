package routes

import (
	"go-api-template/src/handlers"
	"go-api-template/src/middlewares"

	"github.com/brownhounds/swift"
)

func BooksRouter(app *swift.Swift) {
	g := app.Group("/v1").Middleware(middlewares.AuthMiddleware)
	g.Get("/books", handlers.GetBooksHandler)
	g.Get("/books/{id}", handlers.GetBookByIdHandler)
}
