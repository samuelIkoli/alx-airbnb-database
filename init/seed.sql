
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
