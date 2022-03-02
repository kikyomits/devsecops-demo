package main

import (
    "fmt"
    "net/http"
)

//type VetTest struct {
//    Vet  int `json:results_returned`
//}

//func unused(){
//  fmt.Println("unused function")
//}

func hello(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello!")
    fmt.Println("access to hello")
}

func buildServer() (server http.Server){
    http.HandleFunc("/", hello)
    server = http.Server{Addr: ":8080", Handler: nil}
    return
}

func main() {
    s := buildServer()
    err := s.ListenAndServe()
    if err != nil {
        return 
    }
}