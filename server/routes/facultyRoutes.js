const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('./databasedb.sqlite3');


router.get('/',(req,res)=>{
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
  
      const sql = `SELECT * FROM sop_dop_sat_projects WHERE faculty_id = ?`;
  
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
  })
  
  
  
  router.post('/projects', (req, res) => {
    const{project_id,gpsrn,project_title,project_description,date,research_areas,status,comments,faculty_id} = req.body;
  
    db.run('insert into sop_dop_sat_projects (project_id,gpsrn,project_title,project_description,date,research_areas,status,comments,faculty_id) values (?,?,?,?,?,?,?,?,?)',
    [project_id,gpsrn,project_title,project_description,date,research_areas,status,comments,faculty_id], function(err){
      if(err){
        console.error(err);
        return res.status(500).json({error: 'Internal server error'});
      }
      res.json({message : 'Project advertised successfully', project_id : this.lastID});
    })
  
  })
  


module.exports = router;
