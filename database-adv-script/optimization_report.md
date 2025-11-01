## Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql
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

## Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
### Inefficiencies
Multiple Sequential Scans → the DB is reading entire tables linearly.
No index usage on common join/filter keys.
If dataset grows large, this will scale poorly.

## Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
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

-- I can also retrieve only needed columns