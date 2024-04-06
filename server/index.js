// server.js

const express = require('express');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const jwt = require('jsonwebtoken');

const app = express();
const port = 3000;

// SQLite3 database connection
const db = new sqlite3.Database('./databasedb.sqlite3');

app.use(bodyParser.json());

// Login endpoint
app.post('/api/v1/signin', (req, res) => {
  const { email } = req.body;
  
  db.get('SELECT * FROM User WHERE email = ?', [email], (err, row) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal server error' });
    }
    
    if (!row) {
      return res.status(401).json({ error: 'Invalid email' });
    }
    
    // Generate JWT token
    const token = jwt.sign({ userId: row.id, role : row.role }, 'your_secret_key');
    
    res.json({ message: 'Login successful!', token });
  });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
