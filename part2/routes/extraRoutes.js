const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/dogs', async (req, res) => {
  const [rows] = await db.query(
    `
    SELECT dog_id, name FROM Dogs
    WHERE owner_id = ?
    `,
    [req.session.user.user_id]
  );
  return res.send(rows);
});

module.exports = router;
