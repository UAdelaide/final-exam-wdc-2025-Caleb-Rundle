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
-- This line would cause issues if you query for dog_ids by name:
-- ((SELECT user_id FROM Users WHERE username='james123'), 'Max', 'large');

-- You should NOT query by dog name here because dog names are not UNIQUE like with usernames.
-- I'll use subqueries still as the question specifically requests that, but I'll also include
-- hardcoded examples which I would recommend in this case due to the aforementioned reason.
INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status) VALUES
-- Subquery Method
((SELECT dog_id FROM Dogs WHERE name='Max'), '2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name='Bella'), '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name='John Lick'), '2025-06-10 00:00:00', 1, 'Shadowlands', 'cancelled'),
((SELECT dog_id FROM Dogs WHERE name='John Lick'), '2025-06-10 01:30:00', 1, 'BadLands', 'cancelled'),
((SELECT dog_id FROM Dogs WHERE name='Max'), '2025-07-10 08:00:00', 30, 'Parklands', 'open'),
-- Hardcoded Method (as dog names are not unique)
-- Also, it should be noted that duplicate requests are allowed like the following two for Max and Bella:
(1, '2025-06-10 08:00:00', 30, 'Parklands', 'completed'),
(2, '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted');

INSERT INTO WalkRatings (request_id, walker_id, owner_id, rating) VALUES
(1, 2, 1, 5),
(2, 2, 1, 4),
(3, 5, 1, 2);

INSERT INTO WalkApplications (request_id, walker_id) VALUES (1, 2), (5, 2), (7, 5);

-- Just for viewing - no insertions are done here
SELECT * FROM Users;
SELECT * FROM Dogs;
SELECT * FROM WalkRequests;
