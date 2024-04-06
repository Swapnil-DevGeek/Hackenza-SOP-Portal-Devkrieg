// routes.js
const express = require('express');
const router = express.Router();
const Project = require('/models/Project');

// Define route to get all projects
router.get('/projects', async (req, res) => {
  try {
    const projects = await Project.findAll();
    res.json(projects);
  } catch (error) {
    console.error('Error fetching projects:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;
