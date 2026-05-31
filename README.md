# Terranaut

Terranaut is an open-source, gamified fitness platform designed to motivate users to get outside and explore their surroundings. Serving as a privacy-friendly, highly engaging alternative to Strava, the app transforms running, cycling, and walking into real-world quests.

## Features

- **Fitness Sync:** Sync workouts from Fitbit (with future Apple Health and Garmin support).
- **In-Workout Check-ins:** Open the app to write small notes or take pictures during a workout. These are treated as independent, lightweight logs that retroactively link to tracked workouts strictly via overlapping time intervals ($\text{workout\_start} \le \text{check\_in\_time} \le \text{workout\_end}$). If no matching workout arrives, they remain as standalone "micro-adventure" posts.
- **Retroactive Photo Sync:** Upload photos from your camera roll after a workout. Terranaut reads the EXIF data (time/location) to automatically link them to past workouts, or lets you manually assign them.
- **Private Groups:** Stay tightly connected. Participate in family or friend groups; content from people in your groups will automatically show up more frequently on your homepage.
- **Community Homepage:** A gamified feed where you can scroll through recently completed workouts from your group members, people near you, and influencers.

## Core Philosophy & Privacy Architecture

Resilience, absolute user privacy, and robust architecture are foundational to Terranaut. 

- **Zero Telemetry Leaks:** To prevent location tracking via scraped imagery, the client application MUST strip all metadata (including GPS EXIF headers) from image binaries before uploading to Cloudflare R2. Temporal and spatial data are transmitted exclusively via secure backend API payloads.
- **Home Location Protection:** User home locations are never stored as raw spatial points. They are encrypted at the application layer using AES-256-GCM before being saved to PostgreSQL.
- **Anti-Extrapolation Route Masking:** For public feeds, any workout intersecting a user's home exclusion zone is dynamically clipped on the server using a randomized radius and jittered centroid. This prevents malicious actors from cross-referencing public routes to pinpoint a user's residence. Exact routes are restricted solely to opt-in Private Groups.
- **Self-Hosted & Lean:** We prioritize independent technologies and avoid reliance on BaaS or heavy third-party messaging queues. Background jobs and webhook ingest pipelines are managed directly via Go concurrency patterns backed by transactional PostgreSQL staging tables.

## Tech Stack Overview

Built for speed, longevity, and reliability.

- **Backend API:** Go (`Golang`) using the standard library `net/http` router (Go 1.22+).
- **Web Frontend:** React (built with Vite).
- **Database:** PostgreSQL enriched with PostGIS for advanced geospatial queries.
- **Media Storage:** Cloudflare R2 (S3-compatible API) to guarantee easy migration capabilities and avoid steep vendor lock-in.
- **Mobile App:** React Native with Expo.
- **Build Automation:** Make (`Makefile`) build system.

## Feature Tracker

### Infrastructure & Operations
- [x] Initial Monorepo Setup (Backend, Web, Mobile)
- [x] Build tools boilerplate (Makefile)
- [x] Docker configuration for PostGIS
- [ ] Cloudflare R2 (S3) configuration for media storage
- [ ] CI/CD configuration (GitHub Actions)

### Backend API (Go)
- [x] Go 1.22+ `net/http` routing boilerplate
- [ ] PostgreSQL + PostGIS connection and connection pooling
- [ ] Database Schema and Migrations
- [ ] Custom JWT Authentication (Self-hosted)
- [ ] User Onboarding via "Sign in with Google" (OAuth2)
- [ ] Health tracking sync handlers (Fitbit cloud webhooks)

### Web Frontend (React)
- [x] React + Vite app scaffolding
- [ ] Core layout and Navigation
- [ ] Homepage Feed (Strava-like interface)
- [ ] Map View for Check-ins
- [ ] Private Group Management

### Mobile Application (React Native / Expo)
- [x] React Native + Expo initialized
- [ ] Location tracker scaffolding
- [ ] Camera and quick-note interface for "In-Workout Check-ins"
- [ ] HealthKit sync integration (Future)
- [ ] Push Notifications for Groups

### Third-Party Health Integrations
- [ ] Fitbit API integration
- [ ] Apple Health integration (Future)
- [ ] Garmin API integration (Future)
