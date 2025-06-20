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
        new Promise((resolve, reject) => {
            pool.query(query, variables, (queryError, results) => {
                if (queryError) {
                    reject(queryError);
                } else {
                    resolve(results);
                }
            });
        });
    next();
});

const apiRouter = require('./routes/api');

app.use('/api', apiRouter);
