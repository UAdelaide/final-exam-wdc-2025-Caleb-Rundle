const express = require('express');
const path = require('path');
require('dotenv').config();
const session = require('express-session');

const app = express();

// Middleware

// For express sessions:
app.use(
  session({
    secret: 'change-in-production',
    resave: false,
    saveUninitialized: false
  })
);

app.use(express.json());
app.use(express.static(path.join(__dirname, '/public')));

let count = 0;
app.use((req, res, next) => {
  ++count;
  const { method, url } = req;
  console.log(`Request ${count}: ${method} ${url}`);
  next();
});

// Routes
const walkRoutes = require('./routes/walkRoutes');
const userRoutes = require('./routes/userRoutes');

app.use('/api/walks', walkRoutes);
app.use('/api/users', userRoutes);

// Export the app instead of listening here
module.exports = app;
