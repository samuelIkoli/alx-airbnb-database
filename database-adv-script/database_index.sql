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

EXPLAIN
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.status = 'confirmed'
ORDER BY b.created_at DESC
LIMIT 10;