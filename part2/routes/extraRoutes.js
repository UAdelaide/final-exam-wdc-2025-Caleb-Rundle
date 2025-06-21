const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.use('/dogs', async (res, req) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  return res.send(rows);
});

module.exports = router;
