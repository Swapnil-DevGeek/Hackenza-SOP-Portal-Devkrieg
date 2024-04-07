// server.js

const express = require('express');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const jwt = require('jsonwebtoken');
const allapplicationRoute = require('./routes/student-routes/allapplication');
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

//routes 
// app.use('/api/v1/application',allapplicationRoute);


app.get('/api/v1/application-all', (req, res) => {
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

app.post('/api/v1/application', (req, res) => {

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

app.get('/api/v1/admin',(req,res)=>{
  
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



app.get('/api/v1/faculty',(req,res)=>{
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



app.post('/api/v1/faculty-projects', (req, res) => {
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


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
