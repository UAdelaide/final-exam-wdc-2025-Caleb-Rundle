const express = require('express');
const router = express.Router();

router.get('dogs', (req, res) => {
  res.send('hi');
});

module.exports = router;
