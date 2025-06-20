const express = require('express');
const mysql = require('mysql');

const app = express();
const PORT = 3000;
const pool = mysql.createPool({
  host: 'localhost',
  database: 'DogWalkService'
});
const apiRouter = require('./routes/api');

// Start server

app.listen(PORT, (error) => {
  if (!error) {
    console.log('Server running on port ' + PORT);
  } else {
    console.log('Failure to start: ', error);
  }
});

// Define middleware

let count = 0;
app.use((req, res, next) => {
  ++count;
  const { method, url } = req;
  console.log(`Request ${count}: ${method} ${url}`);
  next();
});

app.use((req, res, next) => {
  console.log()
  req.pool = pool;
  req.sqlQuery = async (query, variables) =>
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

app.use('/api', apiRouter);
