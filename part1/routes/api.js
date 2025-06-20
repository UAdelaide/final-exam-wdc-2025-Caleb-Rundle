const express = require('express');
const router = express.Router();

router.get('dogs', (req, res) => {
  console.log('dogs');
  res.send('hi');
  res.sendStatus(200);
});

module.exports = router;
