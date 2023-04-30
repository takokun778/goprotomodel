package main

import (
	"log"

	"github.com/takokun778/goprotomodel/model"
)

func main() {
	u := &model.User{
		UserId: "id",
		Name:   "name",
	}

	log.Printf("%+v", u)
}
