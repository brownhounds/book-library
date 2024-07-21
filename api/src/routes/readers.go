package routes

import (
	"go-api-template/src/handlers"
	"go-api-template/src/middlewares"

	"github.com/brownhounds/swift"
)

func ReadersRouter(app *swift.Swift) {
	g := app.Group("/v1")

	g.Get("/readers", handlers.GetReaders).Middleware(
		middlewares.AuthMiddleware,
		middlewares.IsAdminMiddleware,
	)

	g.Get("/readers/{readerId}", handlers.GetReaderById).Middleware(
		middlewares.AuthMiddleware,
	)

	g.Get("/readers/{readerId}/books", handlers.GetBooksByReaderId).Middleware(
		middlewares.AuthMiddleware,
	)
}
