package handlers

import (
	"encoding/json"
	"go-api-template/src/services/auth_service"
	"net/http"

	"github.com/brownhounds/swift/res"
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
