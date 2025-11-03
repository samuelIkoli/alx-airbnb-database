SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pm.name AS payment_method
FROM bookings b
    JOIN users u
    ON b.user_id = u.user_id
    JOIN properties p
    ON b.property_id = p.property_id
    JOIN payments pay
    ON b.booking_id = pay.booking_id
    JOIN payment_methods pm
    ON pay.payment_method_id = pm.id;

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    pay.amount,
    pay.payment_date,
    pm.name AS payment_method
FROM bookings b
    JOIN users u
    ON b.user_id = u.user_id
    JOIN properties p
    ON b.property_id = p.property_id
    LEFT JOIN payments pay
    ON b.booking_id = pay.booking_id
    LEFT JOIN payment_methods pm
    ON pay.payment_method_id = pm.id;

EXPLAIN ANALYZE
SELECT * FROM users WHERE role_id = 2 AND first_name = 'Victor'