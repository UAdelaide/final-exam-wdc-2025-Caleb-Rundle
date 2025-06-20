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
  const firstQuery = `
SELECT
Users.user_id,
Users.username AS walker_username,
COUNT(WalkRatings.rating_id) AS total_ratings,
AVG(WalkRatings.rating) AS average_rating
FROM Users
LEFT JOIN WalkRatings ON Users.user_id=WalkRatings.walker_id
WHERE Users.role='walker'
GROUP BY WalkRatings.walker_id, Users.username;
`;
  const secondQuery = `
SELECT Users.user_id, COUNT(WalkRequests.request_id) FROM Users
LEFT JOIN WalkApplications ON WalkApplications.walker_id=Users.user_id
LEFT JOIN WalkRequests ON WalkRequests.request_id=WalkApplications.request_id
AND WalkRequests.status='completed'
WHERE Users.role='walker'
GROUP BY WalkApplications.walker_id, Users.username;
`;
  let firstResult;
  let secondResult;
  try {
    const firstResult = await req.sqlQuery(firstQuery);
    return res.status(200).send(result);
  } catch (queryError) {
    return res.status(500).send(queryError);
  }
  try {
    const result = await req.sqlQuery(query);
    return res.status(200).send(result);
  } catch (queryError) {
    return res.status(500).send(queryError);
  }
});

module.exports = router;
