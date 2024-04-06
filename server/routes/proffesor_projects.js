// routes.js
const express = require('express');
const router = express.Router();
const sqlite3 = require('sqlite3').verbose();

// Define route to get all projects
const db = new sqlite3.Database('../databasedb.sqlite3');

//advertise a new project

router.post('/api/v1/projects', (req, res) => {
  const {title,description,requirements} = req.body;
  const faculty_id = req.user.userId;

  db.run('')
})

//advertise a new project 
router


module.exports = router;
