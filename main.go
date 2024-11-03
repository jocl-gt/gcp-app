package main

import (
    "fmt"
    "net/http"
)

func pingHandler(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, `{"message": "pong"}`)
}

func main() {
    http.HandleFunc("/ping", pingHandler)
    port := ":8080"
    fmt.Printf("Starting server on port %s\n", port)
    if err := http.ListenAndServe(port, nil); err != nil {
        fmt.Printf("Error starting server: %s\n", err)
    }
}
