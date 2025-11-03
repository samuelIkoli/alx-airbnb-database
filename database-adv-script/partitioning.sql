-- FOR SOME REASON MY CODE HERE IS BEING HIGHLIGHTED RED BUT IT IS CORRECT

-- -- partitioning.sql

-- -- ========================================
-- -- 1. Backup existing data
-- -- ========================================
-- CREATE TABLE bookings_backup AS
-- SELECT *
-- FROM bookings;

-- -- ========================================
-- -- 2. Drop and recreate the bookings table as partitioned
-- -- ========================================
-- DROP TABLE bookings;

-- CREATE TABLE bookings
-- (
--     booking_id UUID PRIMARY KEY,
--     property_id UUID NOT NULL REFERENCES properties(property_id),
--     user_id UUID NOT NULL REFERENCES users(user_id),
--     start_date DATE NOT NULL,
--     end_date DATE NOT NULL,
--     total_price DECIMAL NOT NULL,
--     status VARCHAR NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- )
-- PARTITION BY RANGE
-- (start_date);

-- -- ========================================
-- -- 3. Create yearly partitions (adjust as needed)
-- -- ========================================
-- CREATE TABLE bookings_2023 PARTITION OF bookings
--     FOR VALUES FROM
-- ('2023-01-01') TO
-- ('2024-01-01');

-- CREATE TABLE bookings_2024 PARTITION OF bookings
--     FOR VALUES FROM
-- ('2024-01-01') TO
-- ('2025-01-01');

-- CREATE TABLE bookings_2025 PARTITION OF bookings
--     FOR VALUES FROM
-- ('2025-01-01') TO
-- ('2026-01-01');

-- -- Default partition for out-of-range data
-- CREATE TABLE bookings_default PARTITION OF bookings DEFAULT;

-- -- ========================================
-- -- 4. Add indexes to each partition for query optimization
-- -- ========================================
-- CREATE INDEX idx_bookings_2023_start_date ON bookings_2023 (start_date);
-- CREATE INDEX idx_bookings_2024_start_date ON bookings_2024 (start_date);
-- CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);

-- CREATE INDEX idx_bookings_2023_user_id ON bookings_2023 (user_id);
-- CREATE INDEX idx_bookings_2024_user_id ON bookings_2024 (user_id);
-- CREATE INDEX idx_bookings_2025_user_id ON bookings_2025 (user_id);

-- -- ========================================
-- -- 5. Restore data
-- -- ========================================
-- INSERT INTO bookings
-- SELECT *
-- FROM bookings_backup;

-- -- ========================================
-- -- 6. Verify partitions and counts
-- -- ========================================
-- SELECT
--     tableoid::regclass AS partition_name,
--     COUNT(*) AS record_count
-- FROM bookings
-- GROUP BY partition_name;
