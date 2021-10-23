package handlers

import (
	"encoding/json"
	"net/http"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/udacity/ud615/app/user"
	"golang.org/x/crypto/bcrypt"
)

type LoginResponse struct {
	Token string `json:"token"`
}

type loginHandler struct {
	secret string
	users  user.Users
}

func (h *loginHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	username, password, ok := r.BasicAuth()
	if !ok {
		http.Error(w, "authorization failed", http.StatusUnauthorized)
		return
	}

	user, ok := h.users[username]
	if !ok {
		http.Error(w, "authorization failed", http.StatusUnauthorized)
		return
	}

	err := bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(password))
	if err != nil {
		http.Error(w, "authorization failed", http.StatusUnauthorized)
		return
	}

	token := jwt.New(jwt.SigningMethodHS256)
	claims := token.Claims.(jwt.MapClaims)
	claims["exp"] = time.Now().Add(time.Hour * 72).Unix()
	claims["iss"] = "auth.service"
	claims["iat"] = time.Now().Unix()
	claims["email"] = user.Email
	claims["sub"] = user.Username

	tokenString, err := token.SignedString([]byte(h.secret))
	if err != nil {
		http.Error(w, "authorization failed", http.StatusUnauthorized)
		return
	}

	response := LoginResponse{
		Token: tokenString,
	}
	json.NewEncoder(w).Encode(response)
}

func LoginHandler(secret string, users user.Users) http.Handler {
	return &loginHandler{
		secret: secret,
		users:  users,
	}
}
