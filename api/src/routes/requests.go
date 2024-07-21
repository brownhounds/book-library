package routes

import (
	"go-api-template/src/handlers"
	"go-api-template/src/middlewares"

	"github.com/brownhounds/swift"
)

func BookRequestRouter(app *swift.Swift) {
	g := app.Group("/v1").Group("/books")

	g.Get("/requests", handlers.GetActiveBookings).Middleware(
		middlewares.AuthMiddleware,
		middlewares.IsAdminMiddleware,
	)

	g.Patch(
		"/requests/{requestId}/approve",
		handlers.MarkBookingCollectedHandler,
	).Middleware(
		middlewares.AuthMiddleware,
		middlewares.IsAdminMiddleware,
	)

	g.Patch("/requests/{requestId}/return", handlers.MarkBookingReturnedHandler).Middleware(
		middlewares.AuthMiddleware,
		middlewares.IsAdminMiddleware,
	)

	g.Post("/{bookId}/requests", handlers.RequestBookingHandler).Middleware(
		middlewares.AuthMiddleware,
	)
}
