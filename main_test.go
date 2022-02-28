package main

import (
	"github.com/stretchr/testify/assert"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestMain(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(hello))
	// Close the server when test finishes
	defer server.Close()

	res, _ := http.Get(server.URL)
	body, _ := io.ReadAll(res.Body)
	msg := string(body)
	assert.Equal(t, msg, "Hello!", "The two words should be the same.")
}
