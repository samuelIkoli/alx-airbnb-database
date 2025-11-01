## High-usage columns in User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
Users -> user_id, email, role_id
Bookings -> user_id, property_id, status, start_date, end_date, created_at
Properties -> property_id, host_id, location, pricepernight, created_at

## SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

## Measurement of the query performance before and after adding indexes using EXPLAIN or ANALYZE.