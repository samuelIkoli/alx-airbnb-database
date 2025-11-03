-- Task 1a) A query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT *
FROM properties p
WHERE (
    SELECT AVG(r.rating)
FROM reviews r
WHERE r.property_id = p.property_id
) > 4;

-- Task 1b) A correlated subquery to find users who have made more than 3 bookings.
SELECT u.*
FROM users u
WHERE (
    SELECT COUNT(*)
FROM bookings b
WHERE b.user_id = u.user_id
) > 3;