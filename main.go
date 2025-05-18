package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from Service A")
	})

	fmt.Println("Server is listening on port 5000...")
	http.ListenAndServe(":5000", nil)
}