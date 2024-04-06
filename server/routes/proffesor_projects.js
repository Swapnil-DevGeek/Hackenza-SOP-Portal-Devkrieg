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

  db.run('insert into projects (title,description,requirements,faculty_id) values (?,?,?,?)',
[title,description,requirements,faculty_id], function(err){
  if(err){
    console.error(err);
    return res.status(500).json({error: 'Internal server error'});
  }
  res.json({message : 'Project advertised successfully', project_id : this.lastID});
})
})


// View all past projects
router.get('/projects', (req, res) => {
  db.all('SELECT * FROM Projects WHERE faculty_id = ?', [req.userId], (err, rows) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal server error' });
    }
    res.json(rows);
  });
});





module.exports = router;
