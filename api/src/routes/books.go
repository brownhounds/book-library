package routes

import (
	"go-api-template/src/handlers"
	"go-api-template/src/middlewares"

	"github.com/brownhounds/swift"
)

func BooksRouter(app *swift.Swift) {
	g := app.Group("/v1")

	g.Get("/books", handlers.GetBooksHandler).Middleware(
		middlewares.AuthMiddleware,
	)
	g.Get("/books/{bookId}", handlers.GetBookByIdHandler).Middleware(
		middlewares.AuthMiddleware,
	)
}
