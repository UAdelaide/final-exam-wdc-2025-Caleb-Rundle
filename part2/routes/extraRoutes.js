const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/dogs', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  return res.send(rows);
});

router.get('/dogImages/:quantity', async (req, res) => {
  const quantity = req.params.quantity;
  const { message, status } = await fetch(
    `https://dog.ceo/api/breeds/image/random/${quantity}`
  ).then((response) => response.json());
  if (status === 'success') {
    return res.status(200).send(message);
  }
  return res.sendStatus(501);
});

module.exports = router;
