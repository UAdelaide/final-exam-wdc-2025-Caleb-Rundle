const express = require('express');

const app = express();
const PORT = 3000;

app.listen(PORT, (error) => {
  if (!error) {
    console.log('Server running on port ' + PORT);
  } else {
    console.log('Failure to start: ', error);
  }
});
