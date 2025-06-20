/*
    Five walk requests:
        A request for Max at 2025-06-10 08:00:00 for 30 minutes at Parklands, with status open.
        A request for Bella at 2025-06-10 09:30:00 for 45 minutes at Beachside Ave, with status accepted.
        Three more walk requests with details of your choosing.
*/

INSERT INTO Users (username, email, password_hash, role) VALUES
('alice123', 'alice@example.com', 'hashed123', 'owner'), -- 1
('bobwalker', 'bob@example.com', 'hashed456', 'walker'), -- 2
('carol123', 'carol@example.com', 'hashed789', 'owner'), -- 3
('james123', 'james@example.com', 'hashed101', 'owner'), -- 4
('johnwalker', 'john@example.com', 'hashed112', 'walker'); -- 5

INSERT INTO Dogs (owner_id, name, size) VALUES
((SELECT user_id FROM Users WHERE username='alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username='carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username='alice123'), 'Max Junior', 'small'),
((SELECT user_id FROM Users WHERE username='alice123'), 'Max Senior', 'large'),
((SELECT user_id FROM Users WHERE username='james123'), 'John Lick', 'large');

-- You should NOT query by dog name here because dog names are not UNIQUE like with usernames.
-- I'll hardcode 2 requests and use subqueries for the rest to demonstrate knowledge of both
-- methods as I'm unsure whether the question wants you to recognize this fact or not.
INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status) VALUES
-- Subquery Method
((SELECT dog_id FROM Dogs WHERE name='Max'), '2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name='Bella'), '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name='John Lick'), '2025-06-10 00:00:00', 1, 'Shadowlands', 'cancelled'),
((SELECT dog_id FROM Dogs WHERE name='John Lick'), '2025-06-10 01:30:00', 1, 'BadLands', 'cancelled'),
((SELECT dog_id FROM Dogs WHERE name='Max'), '2025-07-10 08:00:00', 30, 'Parklands', 'open');
-- Hardcoded (as dog names are not unique)

SELECT * FROM Users;
SELECT * FROM Dogs;
SELECT * FROM WalkRequests;