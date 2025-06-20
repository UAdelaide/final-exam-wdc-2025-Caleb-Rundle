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

-- SELECT * FROM WalkApplications;

SELECT
-- walker names
Users.username AS walker_username,
-- count ratings
COUNT(DISTINCT WalkRatings.rating_id) AS total_ratings,
-- average ratings
AVG(WalkRatings.rating) AS average_rating,
-- count complete walks
COUNT(DISTINCT WalkRequests.request_id) AS completed_walks
-- Users is our LEFT
FROM Users
-- join with walk ratings, but maintain all users found
LEFT JOIN WalkRatings ON Users.user_id=WalkRatings.walker_id
-- join with walk applications but maintain all users found
LEFT JOIN WalkApplications ON WalkApplications.walker_id=Users.user_id
-- join with walk requests but maintain all users found
LEFT JOIN WalkRequests ON WalkRequests.request_id=WalkApplications.request_id
-- only look at requests that are completed
AND WalkRequests.status='completed'
-- only grab matches with walkers
WHERE Users.role='walker'
-- group results by id
GROUP BY Users.user_id;

/* SELECT
Users.username AS walker_username,
COUNT(WalkRatings.rating_id) AS total_ratings,
AVG(WalkRatings.rating) AS average_rating
FROM Users
LEFT JOIN WalkRatings ON Users.user_id=WalkRatings.walker_id
WHERE Users.role='walker'
GROUP BY WalkRatings.walker_id, Users.username;

SELECT Users.username, COUNT(WalkRequests.request_id) FROM Users
LEFT JOIN WalkApplications ON WalkApplications.walker_id=Users.user_id
LEFT JOIN WalkRequests ON WalkRequests.request_id=WalkApplications.request_id
AND WalkRequests.status='completed'
WHERE Users.role='walker'
GROUP BY WalkApplications.walker_id, Users.username;
 */
