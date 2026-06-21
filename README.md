# Terranaut

Terranaut is an open-source gamified workout app designed to encourage users to get outside and follow through with their fitness goals. It is highly collaborative, and fun to use while being privacy-friendly without a subscription.

## Features

- **Fitness Sync**: Sync workouts from Fitbit (Google Health) or Apple Health, with Garmin support coming soon.
- **In-Workouts Check-ins**: Open the app during your run or bike ride to log interesting events or take pictures. Later, when you publish the workout your check-ins document your journey.
- **Private Groups**: Collaborate with family and friends in a competitive manner.
- **Feed**: The main feed allows you to discover people in your community or around the world working out. View their photos and experiences in a privacy respecting manner.

## Core Philosophy

- **Zero Telemetry Leaks**: To prevent location tracking via scraped imagery, all photos are verified to be clear of location data.
- **Home Location Protection**: All activities done near your home do not feature any location data. But by all means, flex that Grand Canyon run.
- **Open-source & Lean**: Our applications and website are open source and built with robust technologies ensuring you have a consistent, fun experience every time you open the app.

## Tech Stack Overview

Built for speed, longevity, and reliability, Terranaut utilizes a robust polyglot stack optimized for scale and privacy.

| Component | Technology/Tool | Purpose |
| :--- | :--- | :--- |
| **Backend API** | Go (`Golang`, v1.22+) | Handles all core business logic, routing (using `net/http`), and webhook ingestion (e.g., Fitbit syncs). |
| **Database** | PostgreSQL + PostGIS | Provides robust data storage with specialized geospatial query capabilities crucial for mapping features. |
| **Web Frontend** | React / Vite | The web interface used by users to view feeds, manage groups, and access the dashboard. |
| **Mobile Application** | React Native / Expo | Cross-platform mobile client responsible for tracking, photo uploads, and in-app interaction (iOS/Android). |
| **Media Storage** | Cloudflare R2 | Used for storing user media (photos); chosen specifically for its S3 compatibility and easy migration path. |
| **Build System** | Make (`Makefile`) | Manages the overall build process across all components (backend, web, mobile). |

## Roadmap

This roadmap will be moved to our website soon.

- [ ] Basic website launch
- [ ] API and Database functionality
- [ ] MPV Website use
- [ ] MPV Mobile App use
- [ ] Workout creation via API
- [ ] Workout edit, delete, and view
- [ ] JWT Authentication
- [ ] PostGIS integrated with workouts
- [ ] Cloudflare R2 (S3) configuration for media storage
- [ ] User Onboarding via "Sign in with Google" (OAuth2)
- [ ] Health tracking sync handlers (Fitbit cloud webhooks)
- [ ] Camera and quick-note interface for check-ins
- [ ] Fitbit API inegration
- [ ] Apple Heath intergration