/*
    Five dogs:
        A dog named Max, who is medium-sized and owned by alice123.
        A dog named Bella, who is small and owned by carol123.
        Three more dogs with details of your choosing.
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
((SELECT user_id FROM Users WHERE username=''), 'Bella Senior', 'large');

SELECT * FROM Users;
SELECT * FROM Dogs;