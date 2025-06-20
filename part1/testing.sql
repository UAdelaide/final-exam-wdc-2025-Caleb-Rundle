-- SELECT Dogs.name AS dog_name, Dogs.size, Users.username AS owner_username FROM Dogs
-- INNER JOIN Users ON Dogs.owner_id=Users.user_id;

-- SELECT
-- WalkRequests.request_id,
-- Dogs.name as dog_name,
-- WalkRequests.requested_time,
-- WalkRequests.duration_minutes,
-- WalkRequests.location,
-- Users.username AS owner_username
-- FROM WalkRequests
-- INNER JOIN Dogs ON Dogs.dog_id=WalkRequests.dog_id
-- INNER JOIN Users ON Dogs.owner_id=Users.user_id
-- WHERE WalkRequests.status='open';

SELECT * FROM WalkApplications;

SELECT
Users.username AS walker_username,
COUNT(WalkRatings.rating_id) AS total_ratings,
AVG(WalkRatings.rating) AS average_rating
FROM Users
LEFT JOIN WalkRatings ON Users.user_id=WalkRatings.walker_id
WHERE Users.role='walker'
GROUP BY WalkRatings.walker_id, Users.username;

SELECT Users.username, COUNT(WalkRequests.request_id) FROM Users
LEFT JOIN WalkRequests on WalkRequests.request_id=WalkApplications.request_id
WHERE Users.role='walker' AND WalkRequests.status='completed'
GROUP BY WalkApplications.walker_id;