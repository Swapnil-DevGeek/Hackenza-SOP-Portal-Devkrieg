// facultyRoutes.js

const express = require('express');
const router = express.Router();

// Define teacher routes
router.get('/courses', (req, res) => {
  res.json({ message: 'List of courses taught by the teacher' });
});

// Add more teacher-specific routes as needed

module.exports = router;
