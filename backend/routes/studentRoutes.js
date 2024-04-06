// studentRoutes.js

const express = require('express');
const router = express.Router();

// Define student routes
router.get('/courses', (req, res) => {
  res.json({ message: 'List of available courses for students' });
});

// Add more student-specific routes as needed

module.exports = router;
