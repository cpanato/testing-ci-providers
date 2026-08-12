-- Unsafe migration: blocking CREATE INDEX + UNIQUE constraint, no lock_timeout.
-- Expected to trip MP001 / MP004 / MP027 and fail `--fail-on critical`.
CREATE INDEX idx_orders_customer ON orders (customer_id);
ALTER TABLE orders ADD CONSTRAINT orders_ref_unique UNIQUE (reference);

-- trigger a PR-changed migration file
ALTER TABLE orders ALTER COLUMN reference TYPE varchar(64);
