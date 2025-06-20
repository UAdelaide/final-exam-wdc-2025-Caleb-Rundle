const express = require('express');
const router = express.Router();

console.log('Loaded routes/api.js');

// SELECT Dogs.name, Dogs.size, Users.username FROM Dogs
// INNER JOIN Users ON Dogs.owner_id=Users.user_id;

router.get('/dogs', async (req, res) => {
  const query = 'SELECT ? FROM Dogs';
  // 'SELECT Dogs.name, Dogs.size, Users.username FROM Dogs INNER JOIN Users ON Dogs.owner_id=Users.user_id';

  try {
    const result = await req.sqlQuery(query, 'name');
    return res.status(200).send(result);
  } catch (queryError) {
    return res.status(500).send(queryError);
  }
});

module.exports = router;
