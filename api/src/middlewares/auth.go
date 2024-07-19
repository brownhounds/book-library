package middlewares

import (
	"context"
	"go-api-template/src/config"
	"go-api-template/src/types"
	"net/http"
	"os"

	"github.com/brownhounds/swift/res"
	"github.com/golang-jwt/jwt"
)

func AuthMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		tokenString := r.Header.Get("Authorization")

		if tokenString == "" {
			res.ApiError(w, http.StatusUnauthorized)
			return
		}

		tokenString = tokenString[len("Bearer "):]

		claims := jwt.MapClaims{}

		token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
			return []byte(os.Getenv(config.JWT_SECRET_KEY)), nil
		})

		if err != nil || !token.Valid {
			res.ApiError(w, http.StatusUnauthorized)
			return
		}
		next.ServeHTTP(w, r.WithContext(
			context.WithValue(r.Context(), types.UserClaims, claims),
		))
	})
}

func IsAdminMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		claims := r.Context().Value(types.UserClaims).(jwt.MapClaims) //nolint
		if !contains(claims["roles"].([]interface{}), "admin") {
			res.ApiError(w, http.StatusForbidden)
			return
		}

		next.ServeHTTP(w, r)
	})
}

func contains(s []interface{}, e string) bool {
	for _, a := range s {
		if a == e {
			return true
		}
	}
	return false
}
