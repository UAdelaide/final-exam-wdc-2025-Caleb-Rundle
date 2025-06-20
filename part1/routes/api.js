const express = require('express');
const router = express.Router();

console.log('Loaded routes/api.js');

// SELECT Dogs.name, Dogs.size, Users.username FROM Dogs
// INNER JOIN Users ON Dogs.owner_id=Users.user_id;

router.get('/dogs', async (req, res) => {
  const query = `
SELECT Dogs.name AS dog_name, Dogs.size, Users.username AS owner_username FROM Dogs
INNER JOIN Users ON Dogs.owner_id=Users.user_id;
`;

  try {
    const result = await req.sqlQuery(query);
    return res.status(200).send(result);
  } catch (queryError) {
    return res.status(500).send(queryError);
  }
});

router.get('/walkrequests/open', async (req, res) => {
  const query = `
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
`;
  try {
    const result = await req.sqlQuery(query);
    return res.status(200).send(result);
  } catch (queryError) {
    return res.status(500).send(queryError);
  }
});

router.get('/walkers/summary', async (req, res) => {
  // Comments have been left in the query (created in testing.sql)
  // to help explain as it's a complicated query
  const query = `
SELECT
-- walker names
Users.username AS walker_username,
-- count ratings
COUNT(DISTINCT WalkRatings.rating_id) AS total_ratings,
-- average ratings
AVG(WalkRatings.rating AS average_rating,
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
`;
  try {
    const result = await req.sqlQuery(query);
    return res.status(200).send(result);
  } catch (queryError) {
    return res.status(500).send(queryError);
  }
});

module.exports = router;
