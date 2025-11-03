
-- USER ROLES
INSERT INTO user_roles
    (id, role_name)
VALUES
    (1, 'guest'),
    (2, 'host'),
    (3, 'admin');

-- USERS
INSERT INTO users
    (user_id, first_name, last_name, email, password_hash, phone_number, role_id, created_at)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', '1234567890', 2, CURRENT_TIMESTAMP),
    ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', '0987654321', 1, CURRENT_TIMESTAMP),
    ('33333333-3333-3333-3333-333333333333', 'Carol', 'Lee', 'carol@example.com', 'hashedpassword3', NULL, 1, CURRENT_TIMESTAMP);

-- PROPERTIES
INSERT INTO properties
    (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Cozy Cabin', 'A lovely cabin in the woods', 'Denver, CO', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', 'Modern Apartment', 'City center apartment with skyline view', 'New York, NY', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- BOOKINGS
INSERT INTO bookings
    (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2025-11-01', '2025-11-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-12-15', '2025-12-20', 1250.00, 'pending', CURRENT_TIMESTAMP);

-- PAYMENT METHODS
INSERT INTO payment_methods
    (id, name)
VALUES
    (1, 'credit_card'),
    (2, 'paypal'),
    (3, 'stripe');

-- PAYMENTS
INSERT INTO payments
    (payment_id, booking_id, amount, payment_date, payment_method_id)
VALUES
    ('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 600.00, CURRENT_TIMESTAMP, 1),
    ('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 1250.00, CURRENT_TIMESTAMP, 2);

-- REVIEWS
INSERT INTO reviews
    (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 5, 'Amazing stay, highly recommended!', CURRENT_TIMESTAMP),
    ('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Nice place but a bit noisy.', CURRENT_TIMESTAMP);

-- MESSAGES
INSERT INTO messages
    (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Is the cabin available in December?', CURRENT_TIMESTAMP),
    ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is. Feel free to book.', CURRENT_TIMESTAMP);
INSERT INTO messages
    (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('eeeeeee3-eeee-eeee-eeee-eeeeeeeeeee3', '44444444-4444-4444-4444-444444444444', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Is the bungalow pet-friendly?', CURRENT_TIMESTAMP),
    ('eeeeeee4-eeee-eeee-eeee-eeeeeeeeeee4', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '44444444-4444-4444-4444-444444444444', 'Yes, pets are allowed.', CURRENT_TIMESTAMP),
    ('eeeeeee5-eeee-eeee-eeee-eeeeeeeeeee5', '55555555-5555-5555-5555-555555555555', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Does the mountain retreat have WiFi?', CURRENT_TIMESTAMP),
    ('eeeeeee6-eeee-eeee-eeee-eeeeeeeeeee6', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '55555555-5555-5555-5555-555555555555', 'Yes, high-speed internet included.', CURRENT_TIMESTAMP),
    ('eeeeeee7-eeee-eeee-eeee-eeeeeeeeeee7', '66666666-6666-6666-6666-666666666666', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Is there parking near the property?', CURRENT_TIMESTAMP),
    ('eeeeeee8-eeee-eeee-eeee-eeeeeeeeeee8', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '66666666-6666-6666-6666-666666666666', 'Private parking space available.', CURRENT_TIMESTAMP),
    ('eeeeeee9-eeee-eeee-eeee-eeeeeeeeeee9', '77777777-7777-7777-7777-777777777777', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Can I extend my booking by one day?', CURRENT_TIMESTAMP),
    ('eeeeee10-eeee-eeee-eeee-eeeeeeeeeee0', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '77777777-7777-7777-7777-777777777777', 'Sure, updated your booking!', CURRENT_TIMESTAMP),
    ('eeeeee11-eeee-eeee-eeee-eeeeeeeeeee1', '88888888-8888-8888-8888-888888888888', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Do you allow early check-in?', CURRENT_TIMESTAMP),
    ('eeeeee12-eeee-eeee-eeee-eeeeeeeeeee2', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '88888888-8888-8888-8888-888888888888', 'Yes, for an extra $50.', CURRENT_TIMESTAMP),
    ('eeeeee13-eeee-eeee-eeee-eeeeeeeeeee3', '99999999-9999-9999-9999-999999999999', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Is there a fireplace?', CURRENT_TIMESTAMP),
    ('eeeeee14-eeee-eeee-eeee-eeeeeeeeeee4', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '99999999-9999-9999-9999-999999999999', 'Yes, and we provide firewood.', CURRENT_TIMESTAMP),
    ('eeeeee15-eeee-eeee-eeee-eeeeeeeeeee5', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Can I bring my kids?', CURRENT_TIMESTAMP),
    ('eeeeee16-eeee-eeee-eeee-eeeeeeeeeee6', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Absolutely, families are welcome!', CURRENT_TIMESTAMP),
    ('eeeeee17-eeee-eeee-eeee-eeeeeeeeeee7', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Is the lake view visible from the balcony?', CURRENT_TIMESTAMP);
INSERT INTO reviews
    (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('ddddddd3-dddd-dddd-dddd-ddddddddddd3', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '44444444-4444-4444-4444-444444444444', 4, 'Good stay overall.', CURRENT_TIMESTAMP),
    ('ddddddd4-dddd-dddd-dddd-ddddddddddd4', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '55555555-5555-5555-5555-555555555555', 5, 'Fantastic view!', CURRENT_TIMESTAMP),
    ('ddddddd5-dddd-dddd-dddd-ddddddddddd5', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '66666666-6666-6666-6666-666666666666', 3, 'Okay stay.', CURRENT_TIMESTAMP),
    ('ddddddd6-dddd-dddd-dddd-ddddddddddd6', 'aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaa4', '77777777-7777-7777-7777-777777777777', 5, 'Loved the fireplace.', CURRENT_TIMESTAMP),
    ('ddddddd7-dddd-dddd-dddd-ddddddddddd7', 'aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', '88888888-8888-8888-8888-888888888888', 4, 'Quiet and cozy.', CURRENT_TIMESTAMP),
    ('ddddddd8-dddd-dddd-dddd-ddddddddddd8', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '99999999-9999-9999-9999-999999999999', 2, 'Too humid.', CURRENT_TIMESTAMP),
    ('ddddddd9-dddd-dddd-dddd-ddddddddddd9', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 5, 'Exceptional host!', CURRENT_TIMESTAMP),
    ('dddddd10-dddd-dddd-dddd-ddddddddddd0', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 4, 'Central and clean.', CURRENT_TIMESTAMP),
    ('dddddd11-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaa4', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 5, 'Great mountain view.', CURRENT_TIMESTAMP),
    ('dddddd12-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 4, 'Lovely interior design.', CURRENT_TIMESTAMP),
    ('dddddd13-dddd-dddd-dddd-ddddddddddd3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 5, 'Perfect getaway.', CURRENT_TIMESTAMP),
    ('dddddd14-dddd-dddd-dddd-ddddddddddd4', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 3, 'A bit pricey.', CURRENT_TIMESTAMP),
    ('dddddd15-dddd-dddd-dddd-ddddddddddd5', 'aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', '12121212-1212-1212-1212-121212121212', 5, 'Fabulous lake view!', CURRENT_TIMESTAMP),
    ('dddddd16-dddd-dddd-dddd-ddddddddddd6', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '13131313-1313-1313-1313-131313131313', 4, 'Nice host, cozy place.', CURRENT_TIMESTAMP),
    ('dddddd17-dddd-dddd-dddd-ddddddddddd7', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '14141414-1414-1414-1414-141414141414', 5, 'Excellent stay!', CURRENT_TIMESTAMP);
INSERT INTO payments
    (payment_id, booking_id, amount, payment_date, payment_method_id)
VALUES
    ('ccccccc3-cccc-cccc-cccc-ccccccccccc3', 'bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 900.00, CURRENT_TIMESTAMP, 1),
    ('ccccccc4-cccc-cccc-cccc-ccccccccccc4', 'bbbbbbb4-bbbb-bbbb-bbbb-bbbbbbbbbbb4', 1200.00, CURRENT_TIMESTAMP, 3),
    ('ccccccc5-cccc-cccc-cccc-ccccccccccc5', 'bbbbbbb5-bbbb-bbbb-bbbb-bbbbbbbbbbb5', 880.00, CURRENT_TIMESTAMP, 2),
    ('ccccccc6-cccc-cccc-cccc-ccccccccccc6', 'bbbbbbb6-bbbb-bbbb-bbbb-bbbbbbbbbbb6', 750.00, CURRENT_TIMESTAMP, 1),
    ('ccccccc7-cccc-cccc-cccc-ccccccccccc7', 'bbbbbbb7-bbbb-bbbb-bbbb-bbbbbbbbbbb7', 1000.00, CURRENT_TIMESTAMP, 2),
    ('ccccccc8-cccc-cccc-cccc-ccccccccccc8', 'bbbbbbb8-bbbb-bbbb-bbbb-bbbbbbbbbbb8', 1200.00, CURRENT_TIMESTAMP, 3),
    ('ccccccc9-cccc-cccc-cccc-ccccccccccc9', 'bbbbbbb9-bbbb-bbbb-bbbb-bbbbbbbbbbb9', 950.00, CURRENT_TIMESTAMP, 1),
    ('cccccc10-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb10-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 870.00, CURRENT_TIMESTAMP, 2),
    ('cccccc11-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb11-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 300.00, CURRENT_TIMESTAMP, 1),
    ('cccccc12-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb12-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 500.00, CURRENT_TIMESTAMP, 2),
    ('cccccc13-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb13-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 1200.00, CURRENT_TIMESTAMP, 3),
    ('cccccc14-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb14-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 1150.00, CURRENT_TIMESTAMP, 1),
    ('cccccc15-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb15-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 700.00, CURRENT_TIMESTAMP, 2),
    ('cccccc16-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb16-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, CURRENT_TIMESTAMP, 1),
    ('cccccc17-cccc-cccc-cccc-ccccccccccc1', 'bbbbbb17-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 400.00, CURRENT_TIMESTAMP, 3);
INSERT INTO bookings
    (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '44444444-4444-4444-4444-444444444444', '2025-12-01', '2025-12-04', 900.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbbb4-bbbb-bbbb-bbbb-bbbbbbbbbbb4', 'aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaa4', '55555555-5555-5555-5555-555555555555', '2025-11-10', '2025-11-13', 1200.00, 'pending', CURRENT_TIMESTAMP),
    ('bbbbbbb5-bbbb-bbbb-bbbb-bbbbbbbbbbb5', 'aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', '66666666-6666-6666-6666-666666666666', '2025-11-05', '2025-11-09', 880.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbbb6-bbbb-bbbb-bbbb-bbbbbbbbbbb6', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '77777777-7777-7777-7777-777777777777', '2025-12-25', '2025-12-30', 750.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbbb7-bbbb-bbbb-bbbb-bbbbbbbbbbb7', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '88888888-8888-8888-8888-888888888888', '2025-11-15', '2025-11-18', 1000.00, 'pending', CURRENT_TIMESTAMP),
    ('bbbbbbb8-bbbb-bbbb-bbbb-bbbbbbbbbbb8', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '99999999-9999-9999-9999-999999999999', '2025-12-02', '2025-12-06', 1200.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbbb9-bbbb-bbbb-bbbb-bbbbbbbbbbb9', 'aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaa4', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2025-10-10', '2025-10-13', 950.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbb10-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '2025-09-01', '2025-09-05', 870.00, 'pending', CURRENT_TIMESTAMP),
    ('bbbbbb11-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '2025-08-10', '2025-08-12', 300.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbb12-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', 'ffffffff-ffff-ffff-ffff-ffffffffffff', '2025-10-01', '2025-10-03', 500.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbb13-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '12121212-1212-1212-1212-121212121212', '2025-07-10', '2025-07-14', 1200.00, 'canceled', CURRENT_TIMESTAMP),
    ('bbbbbb14-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaa4', '13131313-1313-1313-1313-131313131313', '2025-09-11', '2025-09-14', 1150.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbb15-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', '14141414-1414-1414-1414-141414141414', '2025-08-20', '2025-08-24', 700.00, 'pending', CURRENT_TIMESTAMP),
    ('bbbbbb16-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '15151515-1515-1515-1515-151515151515', '2025-09-28', '2025-10-01', 480.00, 'confirmed', CURRENT_TIMESTAMP),
    ('bbbbbb17-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2025-12-09', '2025-12-11', 400.00, 'pending', CURRENT_TIMESTAMP);
INSERT INTO properties
    (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Beachside Bungalow', 'Relax by the waves', 'Miami, FL', 300.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaa4', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Mountain Retreat', 'Secluded mountain view home', 'Aspen, CO', 400.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaa5', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Lakeside Cottage', 'Peaceful getaway near the lake', 'Lake Tahoe, CA', 220.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO users
    (user_id, first_name, last_name, email, password_hash, phone_number, role_id, created_at)
VALUES
    ('44444444-4444-4444-4444-444444444444', 'David', 'Kim', 'david@example.com', 'hashedpassword4', '5551112222', 1, CURRENT_TIMESTAMP),
    ('55555555-5555-5555-5555-555555555555', 'Ella', 'Brown', 'ella@example.com', 'hashedpassword5', '5552223333', 1, CURRENT_TIMESTAMP),
    ('66666666-6666-6666-6666-666666666666', 'Frank', 'Davis', 'frank@example.com', 'hashedpassword6', '5553334444', 1, CURRENT_TIMESTAMP),
    ('77777777-7777-7777-7777-777777777777', 'Grace', 'Miller', 'grace@example.com', 'hashedpassword7', '5554445555', 1, CURRENT_TIMESTAMP),
    ('88888888-8888-8888-8888-888888888888', 'Henry', 'Wilson', 'henry@example.com', 'hashedpassword8', '5555556666', 1, CURRENT_TIMESTAMP),
    ('99999999-9999-9999-9999-999999999999', 'Ivy', 'Taylor', 'ivy@example.com', 'hashedpassword9', '5556667777', 1, CURRENT_TIMESTAMP),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Jack', 'Thomas', 'jack@example.com', 'hashedpassword10', '5557778888', 1, CURRENT_TIMESTAMP),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Karen', 'White', 'karen@example.com', 'hashedpassword11', '5558889999', 2, CURRENT_TIMESTAMP),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'Leo', 'Harris', 'leo@example.com', 'hashedpassword12', '5559990000', 2, CURRENT_TIMESTAMP),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'Mona', 'Clark', 'mona@example.com', 'hashedpassword13', '5550001111', 1, CURRENT_TIMESTAMP),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'Nick', 'Lewis', 'nick@example.com', 'hashedpassword14', '5551112223', 1, CURRENT_TIMESTAMP),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', 'Olivia', 'Walker', 'olivia@example.com', 'hashedpassword15', '5552223334', 1, CURRENT_TIMESTAMP),
    ('12121212-1212-1212-1212-121212121212', 'Paul', 'Hall', 'paul@example.com', 'hashedpassword16', '5553334445', 1, CURRENT_TIMESTAMP),
    ('13131313-1313-1313-1313-131313131313', 'Quinn', 'Allen', 'quinn@example.com', 'hashedpassword17', '5554445556', 1, CURRENT_TIMESTAMP),
    ('14141414-1414-1414-1414-141414141414', 'Rita', 'Young', 'rita@example.com', 'hashedpassword18', '5555556667', 1, CURRENT_TIMESTAMP),
    ('15151515-1515-1515-1515-151515151515', 'Sam', 'King', 'sam@example.com', 'hashedpassword19', '5556667778', 1, CURRENT_TIMESTAMP);
