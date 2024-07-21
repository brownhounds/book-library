package middlewares

import (
	"context"
	"go-api-template/src/services/auth_service"
	"go-api-template/src/types"
	"net/http"

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

		if ok := auth_service.VerifyJWT(tokenString, &claims); !ok {
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
		if ok := IsUserAdmin(r); !ok {
			res.ApiError(w, http.StatusForbidden)
			return
		}

		next.ServeHTTP(w, r)
	})
}

func GetUserIdFromContext(r *http.Request) (string, bool) {
	claims, ok := getClaimsFromContext(r)
	if !ok {
		return "", false
	}

	return claims["sub"].(string), true
}

func IsUserAdmin(r *http.Request) bool {
	claims, ok := getClaimsFromContext(r)
	if !ok {
		return false
	}

	if !contains(claims["roles"].([]interface{}), "admin") {
		return false
	}

	return true
}

func contains(s []interface{}, e string) bool {
	for _, a := range s {
		if a == e {
			return true
		}
	}
	return false
}

func getClaimsFromContext(r *http.Request) (jwt.MapClaims, bool) {
	value := r.Context().Value(types.UserClaims)
	if value == nil {
		return nil, false
	}

	claims, ok := value.(jwt.MapClaims)
	if !ok {
		return nil, false
	}

	return claims, true
}
