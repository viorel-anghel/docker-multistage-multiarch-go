// a simple http server listening on port 8080
// on http request it will show the hostname
// you may also define an environment variable TEXT
// which will be shown on http request

package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {

	// the default text is OK unless defined in the env variable TEXT
	t := os.Getenv("TEXT")
	if t == "" {
		t = "OK"
	}

	t = t + " " + os.Getenv("HOSTNAME")

	fmt.Println("Starting and listening on port 8080")
	fmt.Println("http message will be: " + t)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, t)
	})

	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Hello World!")
	})

	http.ListenAndServe(":8080", nil)
}

