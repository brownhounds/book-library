package handlers

import (
	"encoding/json"
	"go-api-template/src/clients"
	"go-api-template/src/services/auth_service"
	"go-api-template/src/types"
	"net/http"

	pg "github.com/lib/pq"

	"github.com/brownhounds/swift/res"
	"github.com/golang-jwt/jwt"
)

type Credentials struct {
	Email    string
	Password string
}

func LoginHandler(w http.ResponseWriter, r *http.Request) {
	var cred Credentials

	err := json.NewDecoder(r.Body).Decode(&cred)
	if err != nil {
		res.ApiError(w, http.StatusInternalServerError)
		return
	}

	user, err := auth_service.GetUserByEmail(cred.Email)
	if err != nil {
		res.ApiError(w, http.StatusBadRequest)
		return
	}

	if err := auth_service.MatchPassword(cred.Password, user); err != nil {
		res.ApiError(w, http.StatusBadRequest)
		return
	}

	token, err := auth_service.CreateJWT(user)
	if err != nil {
		res.ApiError(w, http.StatusInternalServerError)
		return
	}

	res.Json(w, http.StatusOK, res.Map{
		"token": token,
	})
}

type Whoami struct {
	Id     string         `db:"id"`
	Name   string         `db:"name"`
	Email  string         `db:"email"`
	Avatar string         `db:"avatar"`
	Roles  pg.StringArray `db:"roles"`
}

func WhoamiHandler(w http.ResponseWriter, r *http.Request) {
	claims := r.Context().Value(types.UserClaims).(jwt.MapClaims) //nolint
	userId := claims["sub"]

	conn := clients.Postgres.Connection()
	var whoami Whoami

	err := conn.Get(&whoami, "SELECT id, name, email, avatar, roles FROM get_user_by_id($1)", userId)
	if err != nil {
		panic(err)
	}

	res.Json(w, http.StatusOK, whoami)
}
