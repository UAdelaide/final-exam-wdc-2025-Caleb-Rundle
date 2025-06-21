const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/dogs', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM Dogs');
  const l = rows.length;
  const { message, status } = await fetch(
    `https://dog.ceo/api/breeds/image/random/${l}`
  ).then((response) => response.json());
  if (status === 'success') {
    return res.status(200).send(message);
  }
  rows.forEach((r) => {
    r.photo = message;
  });
  return res.send(rows);
});

router.get('/dogImages/:quantity', async (req, res) => {
  const quantity = req.params.quantity;
  return res.sendStatus(501);
});

module.exports = router;
