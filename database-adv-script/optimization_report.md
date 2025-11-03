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

-- This runs between 90-100ms

## Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
### Inefficiencies

"Hash Join  (cost=42.61..66.05 rows=780 width=368) (actual time=2.430..2.446 rows=17 loops=1)"
"  Hash Cond: (pay.payment_method_id = pm.id)"
"  ->  Hash Join  (cost=4.03..25.42 rows=780 width=340) (actual time=2.292..2.303 rows=17 loops=1)"
"        Hash Cond: (pay.booking_id = b.booking_id)"
"        ->  Seq Scan on payments pay  (cost=0.00..17.80 rows=780 width=76) (actual time=0.089..0.091 rows=17 loops=1)"
"        ->  Hash  (cost=3.82..3.82 rows=17 width=280) (actual time=1.817..1.819 rows=17 loops=1)"
"              Buckets: 1024  Batches: 1  Memory Usage: 11kB"
"              ->  Hash Join  (cost=2.54..3.82 rows=17 width=280) (actual time=1.780..1.795 rows=17 loops=1)"
"                    Hash Cond: (b.property_id = p.property_id)"
"                    ->  Hash Join  (cost=1.43..2.65 rows=17 width=216) (actual time=1.038..1.047 rows=17 loops=1)"
"                          Hash Cond: (b.user_id = u.user_id)"
"                          ->  Seq Scan on bookings b  (cost=0.00..1.17 rows=17 width=120) (actual time=0.150..0.152 rows=17 loops=1)"
"                          ->  Hash  (cost=1.19..1.19 rows=19 width=112) (actual time=0.539..0.540 rows=19 loops=1)"
"                                Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                ->  Seq Scan on users u  (cost=0.00..1.19 rows=19 width=112) (actual time=0.356..0.359 rows=19 loops=1)"
"                    ->  Hash  (cost=1.05..1.05 rows=5 width=80) (actual time=0.730..0.731 rows=5 loops=1)"
"                          Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                          ->  Seq Scan on properties p  (cost=0.00..1.05 rows=5 width=80) (actual time=0.322..0.324 rows=5 loops=1)"
"  ->  Hash  (cost=22.70..22.70 rows=1270 width=36) (actual time=0.112..0.112 rows=3 loops=1)"
"        Buckets: 2048  Batches: 1  Memory Usage: 17kB"
"        ->  Seq Scan on payment_methods pm  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.097..0.098 rows=3 loops=1)"
"Planning Time: 1.349 ms"
"Execution Time: 2.652 ms"

SUMMARY
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


RESULT AFTER EXPLAIN ANALYSE
"Hash Left Join  (cost=42.61..66.05 rows=780 width=288) (actual time=0.677..0.687 rows=17 loops=1)"
"  Hash Cond: (pay.payment_method_id = pm.id)"
"  ->  Hash Right Join  (cost=4.03..25.42 rows=780 width=260) (actual time=0.334..0.342 rows=17 loops=1)"
"        Hash Cond: (pay.booking_id = b.booking_id)"
"        ->  Seq Scan on payments pay  (cost=0.00..17.80 rows=780 width=60) (actual time=0.028..0.029 rows=17 loops=1)"
"        ->  Hash  (cost=3.82..3.82 rows=17 width=216) (actual time=0.280..0.282 rows=17 loops=1)"
"              Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"              ->  Hash Join  (cost=2.54..3.82 rows=17 width=216) (actual time=0.266..0.273 rows=17 loops=1)"
"                    Hash Cond: (b.property_id = p.property_id)"
"                    ->  Hash Join  (cost=1.43..2.65 rows=17 width=200) (actual time=0.106..0.111 rows=17 loops=1)"
"                          Hash Cond: (b.user_id = u.user_id)"
"                          ->  Seq Scan on bookings b  (cost=0.00..1.17 rows=17 width=120) (actual time=0.040..0.041 rows=17 loops=1)"
"                          ->  Hash  (cost=1.19..1.19 rows=19 width=112) (actual time=0.043..0.043 rows=19 loops=1)"
"                                Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                ->  Seq Scan on users u  (cost=0.00..1.19 rows=19 width=112) (actual time=0.029..0.031 rows=19 loops=1)"
"                    ->  Hash  (cost=1.05..1.05 rows=5 width=48) (actual time=0.136..0.136 rows=5 loops=1)"
"                          Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                          ->  Seq Scan on properties p  (cost=0.00..1.05 rows=5 width=48) (actual time=0.123..0.125 rows=5 loops=1)"
"  ->  Hash  (cost=22.70..22.70 rows=1270 width=36) (actual time=0.046..0.046 rows=3 loops=1)"
"        Buckets: 2048  Batches: 1  Memory Usage: 17kB"
"        ->  Seq Scan on payment_methods pm  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.037..0.038 rows=3 loops=1)"
"Planning Time: 5.140 ms"
"Execution Time: 0.857 ms"    

-- I can also retrieve only needed columns