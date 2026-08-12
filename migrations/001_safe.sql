-- Safe migration: should score GREEN.
SET lock_timeout = '5s';

CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_users_email ON users (email);
