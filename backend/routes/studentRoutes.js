const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('./databasedb.sqlite3');


router.get('/', (req, res) => {
    // Check if user is authenticated
    
    const header = req.headers.authorization;
    if(!header){
      return res.status(401).json({ error: 'Unauthorized' });
    }
    
    const token = header;
    jwt.verify(token, 'your_secret_key', (err, decoded) => {
      if (err) {
        return res.status(401).json({ error: 'Unauthorized' });
      }else{
        console.log(decoded);
      }
      const {userId} = decoded;
  
      const sql = `SELECT * FROM student_project_applications WHERE student_id = ?`;
  
    // Execute the query
    db.all(sql, [userId], (err, rows) => {
        if (err) {
            console.error(err.message);
            res.status(500).send('Internal Server Error');
        } else {
            res.json(rows); // Send the fetched applications as JSON response
        }
    });
  })
  });
  
  router.post('/application', (req, res) => {
  
  const{student_id, project_id, gpsrn,comments,justification,status,application_date,faculty_comment} = req.body;
  
  db.run('insert into student_project_applications (student_id, project_id, gpsrn, comments, justification, status, application_date, faculty_comment) values (?,?,?,?,?,?,?,?)',
  [student_id, project_id, gpsrn, comments, justification, status, application_date, faculty_comment], function(err){
    if(err){
      console.error(err);
      return res.status(500).json({error: 'Internal server error'});
    }
    res.json({message : 'Application submitted successfully', application_id : this.lastID});
  })
  })
  
  router.get('/project',(req,res)=>{
    const sql = `SELECT * FROM sop_dop_sat_projects`;
    db.all(sql, (err, rows) => {
        if (err) {
            console.error(err.message);
            res.status(500).send('Internal Server Error');
        } else {
            res.json(rows); // Send the fetched projects as JSON response
        }
    });
  })
  

module.exports = router;
