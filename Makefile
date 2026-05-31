.PHONY: dev-backend dev-web dev-mobile up down setup config lint lint-web lint-mobile lint-backend typecheck typecheck-web typecheck-mobile typecheck-backend

# Run all setup dependencies (Docker containers, etc.)
up:
	docker compose up -d

# Stop running dependencies
down:
	docker compose down

# Dev script to run the Go backend API
dev-backend:
	cd backend && go run ./cmd/api

# Dev script to run the React Web Dashboard
dev-web:
	cd web && pnpm run dev

# Dev script to run the React Native Mobile Application
dev-mobile:
	cd mobile && pnpm start

# Install all dependencies across the monorepo
setup:
	cd web && pnpm install
	cd mobile && pnpm install
	cd backend && go mod tidy

# Lint across the monorepo
lint: lint-web lint-mobile lint-backend

lint-web:
	cd web && pnpm run lint

lint-mobile:
	cd mobile && pnpm run lint

lint-backend:
	cd backend && go vet ./...

# Typecheck across the monorepo
typecheck: typecheck-web typecheck-mobile typecheck-backend

typecheck-web:
	cd web && pnpm run typecheck

typecheck-mobile:
	cd mobile && pnpm run typecheck

typecheck-backend:
	cd backend && go test ./...
