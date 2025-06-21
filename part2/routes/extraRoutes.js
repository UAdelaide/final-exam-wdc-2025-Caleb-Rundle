const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/dogs', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  const l = rows.length;
  const { message, status } = await fetch(
    `https://dog.ceo/api/breeds/image/random/${l}`
  ).then((response) => response.json());
  if (status !== 'success') {
    return res.status(501).send(message);
  }
    for (const [i, val] of rows.entries()) {
        
    }
  rows.forEach((r, i) => {
    r.photo = message;
  });
  return res.send(rows);
});

module.exports = router;
