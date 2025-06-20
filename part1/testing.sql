SELECT Dogs.name AS dog_name, Dogs.size, Users.username AS owner_username FROM Dogs
INNER JOIN Users ON Dogs.owner_id=Users.user_id;

SELECT
WalkRequests.request_id,
Dogs.name as dog_name,
WalkRequests.requested_time,
WalkRequests.duration_minutes,
WalkRequests.location,
Users.username AS owner_username
FROM WalkRequests
INNER JOIN Dogs ON Dogs.dog_id=WalkRequests.dog_id
INNER JOIN Users ON Dogs.owner_id=Users.user_id
WHERE WalkRequests.status='open';

/*
INSERT INTO WalkRatings (request_id, walker_id, owner_id, rating) VALUES
(1, 2, 1, 5),
(2, 2, 1, 4),
(3, 5, 1, 2);
*/

SELECT * FROM WalkRatings;

SELECT
Users.username AS walker_username,
COUNT(*) AS total_ratings,
AVG(WalkRatings.rating) as average_rating
FROM WalkRatings
INNER JOIN Users ON Users.user_id=WalkRatings.walker_id
GROUP BY WalkRatings.walker_id;

SELECT COUNT(*) FROM WalkRequests
GROUP BY 