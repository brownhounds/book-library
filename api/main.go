package main

import (
	"go-api-template/src/clients"
	"go-api-template/src/config"
	"net/http"

	"github.com/brownhounds/swift"
	"github.com/brownhounds/swift/env"
	"github.com/brownhounds/swift/res"
)

func main() {
	env.InitWithMandatoryVariables(config.MandatoryEnvVariables)

	app := swift.New()
	// app.OApiValidator("schema.yml")

	app.OnBoot(func() {
		clients.PostgresInit()
	})

	app.SwaggerStaticServer(".swagger", "/docs")
	app.SwaggerServe(true)

	app.Get("/test", func(w http.ResponseWriter, r *http.Request) {
		res.Json(w, http.StatusOK ,res.Map{
			"message": "Hello There!",
		})
	})

	app.Serve(env.Env(config.SERVER_HOST), env.Env(config.SERVER_PORT))
}
