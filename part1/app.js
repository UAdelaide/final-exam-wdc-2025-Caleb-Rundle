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

app.use((req, res, next) => {
    req.pool = pool;
    req.sqlQuery = async (query, variables) => {
        pool.query
    }
})

const apiRouter = require('./routes/api');

app.use('/api', apiRouter);
