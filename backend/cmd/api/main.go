package main

import (
	"encoding/json"
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	// System Health Check
	mux.HandleFunc("GET /api", healthCheckHandler)
	mux.HandleFunc("GET /api/health", healthCheckHandler)

	port := ":3001"
	log.Printf("Terranaut Backend API running on port %s", port)

	if err := http.ListenAndServe(port, mux); err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}

// Responds informing the client that the API is running
func healthCheckHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{
		"status":  "healthy",
		"service": "Terranaut API",
	})
}
