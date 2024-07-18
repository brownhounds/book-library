package routes

import (
	"go-api-template/src/handlers"
	"go-api-template/src/middlewares"

	"github.com/brownhounds/swift"
)

func AuthRouter(app *swift.Swift) {
	g := app.Group("/v1").Group("/auth")

	g.Post("/login", handlers.LoginHandler)
	g.Get("/whoami", handlers.WhoamiHandler).Middleware(middlewares.AuthMiddleware)
}
