# Simple CRUD REST API

A production-ready Spring Boot CRUD API for Items, deployable to Railway.

## Tech Stack

- Java 17
- Spring Boot 3.2.x
- Spring Data JPA
- PostgreSQL
- Maven
- Lombok

## Run Locally

### 1. Set Environment Variables

```bash
export DATABASE_URL="jdbc:postgresql://your-neon-host/dbname?sslmode=require"
export DATABASE_USERNAME="your-username"
export DATABASE_PASSWORD="your-password"
```

### 2. Start the App

```bash
./mvnw spring-boot:run
```

The API runs on http://localhost:8080 by default.

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/items | List all items |
| GET | /api/items/{id} | Get item by ID |
| POST | /api/items | Create item |
| PUT | /api/items/{id} | Update item |
| DELETE | /api/items/{id} | Delete item |
| GET | /health | Health check |

### Example: Create an Item

```bash
curl -X POST http://localhost:8080/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "My Item", "description": "A test item"}'
```

## Deploy to Railway

1. Push this repo to GitHub
2. Go to [Railway Dashboard](https://railway.app)
3. Click **New Project** → **Deploy from GitHub Repo** → select your repo
4. Railway auto-detects the Dockerfile and builds the image
5. In **Variables** tab, add:
   - `DATABASE_URL` — your Postgres connection string
   - `DATABASE_USERNAME` — your DB username
   - `DATABASE_PASSWORD` — your DB password
6. Railway provisions a public URL automatically
7. Deploy

## Run with Docker

```bash
docker build -t demo-api .
docker run -p 8080:8080 \
  -e DATABASE_URL="jdbc:postgresql://host/db?sslmode=require" \
  -e DATABASE_USERNAME="user" \
  -e DATABASE_PASSWORD="pass" \
  demo-api
```
