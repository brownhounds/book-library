package main

import (
	"go-api-template/src/clients"
	"go-api-template/src/config"
	"go-api-template/src/middlewares"
	"go-api-template/src/routes"

	"github.com/brownhounds/swift"
	"github.com/brownhounds/swift/env"
)

func main() {
	env.InitWithMandatoryVariables(config.MandatoryEnvVariables)

	app := swift.New()

	app.AddCorsMiddleware(middlewares.Cors)

	app.OApiValidator("schema.yml")
	app.SwaggerStaticServer(".swagger", "/docs")
	app.SwaggerServe(true)

	app.OnBoot(func() {
		clients.PostgresInit()
	})

	routes.AuthRouter(app)
	routes.BooksRouter(app)
	routes.BookRequestRouter(app)
	routes.ReadersRouter(app)

	app.Serve(env.Env(config.SERVER_HOST), env.Env(config.SERVER_PORT))
}
