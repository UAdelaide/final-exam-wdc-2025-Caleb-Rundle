const express = require('express');
const router = express.Router();

console.log('Loaded routes/api.js');

// SELECT Dogs.name, Dogs.size, Users.username FROM Dogs
// INNER JOIN Users ON Dogs.owner_id=Users.user_id;

router.get('/dogs', async (req, res) => {
  try {
    const query = await req.sqlQuery(
      'SELECT Dogs.name, Dogs.size, Users.username FROM Dogs \
    INNER JOIN Users ON Dogs.owner_id=USERS.user_id'
    );
  } catch (queryError){}
  res.status(200).send('test');
});

module.exports = router;
