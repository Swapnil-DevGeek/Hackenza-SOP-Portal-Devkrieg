const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('./databasedb.sqlite3');

// Admin-specific routes

router.get('/',(req,res)=>{
  
    const header = req.headers.authorization;
    if(!header){
      return res.status(401).json({ error: 'Unauthorized' });
    }
    
    const token = header;
    jwt.verify(token, 'your_secret_key', (err, decoded) => {
      if (err) {
        return res.status(401).json({ error: 'Unauthorized' });
      } else {
        console.log(decoded);
        const {userId} = decoded;
  
        const sql = `SELECT * FROM sop_dop_sat_projects`;
  
        // Execute the query
        db.all(sql, (err, rows) => {
          if (err) {
            console.error(err.message);
            res.status(500).send('Internal Server Error');
          } else {
            res.json(rows); // Send the fetched projects as JSON response
          }
        });
      }
    });
  });
  

module.exports = router;
