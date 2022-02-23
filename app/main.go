package main

import (
    "fmt"
    "log"
    "net/http"
)

func hello(w http.ResponseWriter, r *http.Request){
    fmt.Fprintf(w, "Hello!")
    fmt.Println("access to hello")
}

func handleRequests() {
    http.HandleFunc("/", hello)
    log.Fatal(http.ListenAndServe(":8080", nil))
}

func main() {
    handleRequests()
}