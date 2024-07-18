package routes

import (
	"go-api-template/src/handlers"

	"github.com/brownhounds/swift"
)

func AuthRouter(app *swift.Swift) {
	g := app.Group("/v1").Group("/auth")

	g.Post("/login", handlers.LoginHandler)
}
