const express = require('express');
const router = express.Router();

console.log('Loaded routes/api.js');

router.get('/dogs', (req, res) => {
  res.status(200).send('test');
});

module.exports = router;
