# Jenkins Docker Compose Configuration

This Docker Compose configuration allows you to set up Jenkins with an agent.

## Version

This configuration is designed for Metabase version 3.9.

## Services

### Metabase

- **Image**: metabase/metabase:latest
- **Container Name**: metabase
- **Hostname**: metabase
- **Volumes**:
  - `/dev/urandom:/dev/random:ro`
- **Ports**:
  - `3000:3000`
- **Environment Variables**:
  - `MB_DB_TYPE`: postgres
  - `MB_DB_DBNAME`: metabase
  - `MB_DB_PORT`: 5432
  - `MB_DB_USER_FILE`: /run/secrets/db_user
  - `MB_DB_PASS_FILE`: /run/secrets/db_password
  - `MB_DB_HOST`: postgres
- **Network**: metanet1
- **Secrets**:
  - db_password
  - db_user
- **Healthcheck**:
  - Test: `curl --fail -I http://localhost:3000/api/health || exit 1`
  - Interval: 15s
  - Timeout: 5s
  - Retries: 5

### PostgreSQL

- **Image**: postgres:latest
- **Container Name**: postgres
- **Hostname**: postgres
- **Environment Variables**:
  - `POSTGRES_USER_FILE`: /run/secrets/db_user
  - `POSTGRES_DB`: metabase
  - `POSTGRES_PASSWORD_FILE`: /run/secrets/db_password
- **Network**: metanet1
- **Secrets**:
  - db_password
  - db_user

## Networks

- **Name**: metanet1
- **Driver**: bridge

## Secrets

### db_password

- **File**: db_password.txt

### db_user

- **File**: db_user.txt

## Usage

1. Make sure you have Docker and Docker Compose installed on your system.
2. Create the `db_password.txt` and `db_user.txt` files with your PostgreSQL password and username, respectively.
3. Run the following command to start Metabase and PostgreSQL:

   ```bash
   docker-compose up -d
