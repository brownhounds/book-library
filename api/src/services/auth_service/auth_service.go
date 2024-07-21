package auth_service

import (
	"go-api-template/src/clients"
	"go-api-template/src/config"
	"os"
	"time"

	"github.com/golang-jwt/jwt"
	pg "github.com/lib/pq"
	"golang.org/x/crypto/bcrypt"
)

type User struct {
	Id       string         `db:"id"`
	Name     string         `db:"name"`
	Password string         `db:"password"`
	Email    string         `db:"email"`
	Avatar   string         `db:"avatar"`
	Roles    pg.StringArray `db:"roles"`
}

func GetUserByEmail(email string) (*User, error) {
	conn := clients.Postgres.Connection()
	var user User

	err := conn.Get(&user, "SELECT * FROM get_user_by_email($1)", email)
	if err != nil {
		return nil, err
	}

	return &user, nil
}

func MatchPassword(password string, user *User) error {
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		return err
	}

	return nil
}

func CreateJWT(user *User) (string, error) {
	token := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		jwt.MapClaims{
			"sub":   user.Id,
			"iat":   time.Now().Unix(),
			"roles": user.Roles,
		})

	tokenString, err := token.SignedString([]byte(os.Getenv(config.JWT_SECRET_KEY)))
	if err != nil {
		return "", err
	}

	return tokenString, nil
}

func VerifyJWT(t string, claims *jwt.MapClaims) bool {
	token, err := jwt.ParseWithClaims(t, claims, func(token *jwt.Token) (interface{}, error) {
		return []byte(os.Getenv(config.JWT_SECRET_KEY)), nil
	})

	if err != nil || !token.Valid {
		return false
	}

	return true
}
