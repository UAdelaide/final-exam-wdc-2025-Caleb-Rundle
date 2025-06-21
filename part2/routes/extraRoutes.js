const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/dogs', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  return res.send(rows);
});

router.get('/dog-images/:quantity', async (req, res) => {
  const quantity = req.params.quantity;
  const { message, status } = await fetch(
    `https://dog.ceo/api/breeds/image/random/${quantity}`
  ).then((res) => res.json());
    if
});

module.exports = router;
