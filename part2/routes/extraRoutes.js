const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/dogs', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  return res.send(rows);
});

router.get('/dog-images/:count', async (req, res))

module.exports = router;
