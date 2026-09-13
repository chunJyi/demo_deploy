# Simple CRUD REST API

A production-ready Spring Boot CRUD API for Items, deployable to Koyeb.

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

## Deploy to Koyeb

1. Push this repo to GitHub
2. Go to [Koyeb Dashboard](https://app.koyeb.com)
3. Click **Create App** → **GitHub** → select your repo
4. Koyeb auto-detects the Dockerfile
5. In **Environment Variables**, add as secrets:
   - `DATABASE_URL` — your Neon Postgres connection string
   - `DATABASE_USERNAME` — your DB username
   - `DATABASE_PASSWORD` — your DB password
6. Click **Deploy**

## Run with Docker

```bash
docker build -t demo-api .
docker run -p 8080:8080 \
  -e DATABASE_URL="jdbc:postgresql://host/db?sslmode=require" \
  -e DATABASE_USERNAME="user" \
  -e DATABASE_PASSWORD="pass" \
  demo-api
```
# demo_deploy
