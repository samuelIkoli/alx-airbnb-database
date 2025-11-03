## High-usage columns in User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
Users -> user_id, email, role_id
Bookings -> user_id, property_id, status, start_date, end_date, created_at
Properties -> property_id, host_id, location, pricepernight, created_at

## SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
-- database_index.sql

-- ===== USERS TABLE INDEXES =====
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_users_role_id ON users (role_id);

-- ===== BOOKINGS TABLE INDEXES =====
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_status ON bookings (status);
CREATE INDEX idx_bookings_start_end_date ON bookings (start_date, end_date);
CREATE INDEX idx_bookings_created_at ON bookings (created_at);

-- ===== PROPERTIES TABLE INDEXES =====
CREATE INDEX idx_properties_host_id ON properties (host_id);
CREATE INDEX idx_properties_location ON properties (location);
CREATE INDEX idx_properties_pricepernight ON properties (pricepernight);
CREATE INDEX idx_properties_created_at ON properties (created_at);


## Measurement of the query performance before and after adding indexes using EXPLAIN or ANALYZE.
1. 
EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.status = 'confirmed'
ORDER BY b.created_at DESC
LIMIT 10;

RESULT BEFORE
"Limit  (cost=31.68..31.69 rows=3 width=316) (actual time=0.171..0.175 rows=10 loops=1)"
"  ->  Sort  (cost=31.68..31.69 rows=3 width=316) (actual time=0.169..0.171 rows=10 loops=1)"
"        Sort Key: b.created_at DESC"
"        Sort Method: quicksort  Memory: 27kB"
"        ->  Hash Join  (cost=16.54..31.66 rows=3 width=316) (actual time=0.129..0.138 rows=10 loops=1)"
"              Hash Cond: (u.user_id = b.user_id)"
"              ->  Seq Scan on users u  (cost=0.00..13.70 rows=370 width=188) (actual time=0.017..0.019 rows=19 loops=1)"
"              ->  Hash  (cost=16.50..16.50 rows=3 width=128) (actual time=0.025..0.025 rows=10 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                    ->  Seq Scan on bookings b  (cost=0.00..16.50 rows=3 width=128) (actual time=0.007..0.011 rows=10 loops=1)"
"                          Filter: ((status)::text = 'confirmed'::text)"
"                          Rows Removed by Filter: 7"
"Planning Time: 0.355 ms"
"Execution Time: 0.224 ms"

RESULT AFTER
"Limit  (cost=2.51..2.51 rows=1 width=316) (actual time=0.399..0.401 rows=10 loops=1)"
"  ->  Sort  (cost=2.51..2.51 rows=1 width=316) (actual time=0.398..0.399 rows=10 loops=1)"
"        Sort Key: b.created_at DESC"
"        Sort Method: quicksort  Memory: 27kB"
"        ->  Hash Join  (cost=1.22..2.50 rows=1 width=316) (actual time=0.353..0.358 rows=10 loops=1)"
"              Hash Cond: (u.user_id = b.user_id)"
"              ->  Seq Scan on users u  (cost=0.00..1.19 rows=19 width=188) (actual time=0.231..0.233 rows=19 loops=1)"
"              ->  Hash  (cost=1.21..1.21 rows=1 width=128) (actual time=0.082..0.082 rows=10 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                    ->  Seq Scan on bookings b  (cost=0.00..1.21 rows=1 width=128) (actual time=0.064..0.066 rows=10 loops=1)"
"                          Filter: ((status)::text = 'confirmed'::text)"
"                          Rows Removed by Filter: 7"
"Planning Time: 0.953 ms"
"Execution Time: 0.519 ms"


2. 
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
    LEFT JOIN bookings b
    ON u.user_id = b.user_id
GROUP BY 
    u.user_id, 
    u.first_name, 
    u.last_name
ORDER BY total_bookings DESC;

RESULT BEFORE
"Sort  (cost=56.98..57.91 rows=370 width=88) (actual time=0.341..0.343 rows=19 loops=1)"
"  Sort Key: (count(b.booking_id)) DESC"
"  Sort Method: quicksort  Memory: 26kB"
"  ->  HashAggregate  (cost=37.50..41.20 rows=370 width=88) (actual time=0.215..0.220 rows=19 loops=1)"
"        Group Key: u.user_id"
"        Batches: 1  Memory Usage: 37kB"
"        ->  Hash Right Join  (cost=18.32..34.90 rows=520 width=96) (actual time=0.204..0.210 rows=20 loops=1)"
"              Hash Cond: (b.user_id = u.user_id)"
"              ->  Seq Scan on bookings b  (cost=0.00..15.20 rows=520 width=32) (actual time=0.038..0.039 rows=17 loops=1)"
"              ->  Hash  (cost=13.70..13.70 rows=370 width=80) (actual time=0.109..0.109 rows=19 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                    ->  Seq Scan on users u  (cost=0.00..13.70 rows=370 width=80) (actual time=0.081..0.083 rows=19 loops=1)"
"Planning Time: 2.636 ms"
"Execution Time: 0.726 ms"

RESULT AFTER
"Sort  (cost=3.34..3.39 rows=19 width=88) (actual time=0.316..0.318 rows=19 loops=1)"
"  Sort Key: (count(b.booking_id)) DESC"
"  Sort Method: quicksort  Memory: 26kB"
"  ->  HashAggregate  (cost=2.75..2.94 rows=19 width=88) (actual time=0.273..0.278 rows=19 loops=1)"
"        Group Key: u.user_id"
"        Batches: 1  Memory Usage: 24kB"
"        ->  Hash Right Join  (cost=1.43..2.65 rows=19 width=96) (actual time=0.242..0.254 rows=20 loops=1)"
"              Hash Cond: (b.user_id = u.user_id)"
"              ->  Seq Scan on bookings b  (cost=0.00..1.17 rows=17 width=32) (actual time=0.021..0.023 rows=17 loops=1)"
"              ->  Hash  (cost=1.19..1.19 rows=19 width=80) (actual time=0.093..0.093 rows=19 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                    ->  Seq Scan on users u  (cost=0.00..1.19 rows=19 width=80) (actual time=0.050..0.053 rows=19 loops=1)"
"Planning Time: 1.034 ms"
"Execution Time: 0.484 ms"
3. 
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM users u
FULL OUTER JOIN bookings b
    ON u.user_id = b.user_id;

RESULT BEFORE
"Hash Full Join  (cost=18.32..34.90 rows=520 width=216) (actual time=0.280..0.293 rows=20 loops=1)"
"  Hash Cond: (b.user_id = u.user_id)"
"  ->  Seq Scan on bookings b  (cost=0.00..15.20 rows=520 width=120) (actual time=0.050..0.051 rows=17 loops=1)"
"  ->  Hash  (cost=13.70..13.70 rows=370 width=112) (actual time=0.178..0.178 rows=19 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"        ->  Seq Scan on users u  (cost=0.00..13.70 rows=370 width=112) (actual time=0.140..0.157 rows=19 loops=1)"
"Planning Time: 0.659 ms"
"Execution Time: 0.721 ms"

RESULT AFTER
"Hash Full Join  (cost=1.43..2.65 rows=19 width=216) (actual time=0.098..0.111 rows=20 loops=1)"
"  Hash Cond: (b.user_id = u.user_id)"
"  ->  Seq Scan on bookings b  (cost=0.00..1.17 rows=17 width=120) (actual time=0.015..0.017 rows=17 loops=1)"
"  ->  Hash  (cost=1.19..1.19 rows=19 width=112) (actual time=0.044..0.044 rows=19 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"        ->  Seq Scan on users u  (cost=0.00..1.19 rows=19 width=112) (actual time=0.020..0.024 rows=19 loops=1)"
"Planning Time: 2.371 ms"
"Execution Time: 0.200 ms"