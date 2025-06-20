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
SELECT * FROM WalkRatings;

SELECT
Users.username AS walker_username,
COUNT(*) AS total_ratings,
AVG(WalkRatings.rating) as average_rating
FROM WalkRatings
INNER JOIN Users ON Users.user_id=WalkRatings.walker_id
GROUP BY WalkRatings.walker_id;

SELECT COUNT(*) FROM WalkApplications
INNER JOIN WalkRequests on WalkApplications.request_id=WalkRequests.request_id
WHERE WalkRequests.status='completed'
GROUP BY WalkApplications.walker_id;