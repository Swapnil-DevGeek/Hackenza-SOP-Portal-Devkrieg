const express = require("express");
const router = express.Router();
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('../../databasedb.sqlite3');

router.get('/api/v1/application-all', (req, res) => {
    // Check if user is authenticated
    if (!req.user) {
        return res.status(401).json({ error: 'Unauthorized' });
    }

    const userId = req.user.id; // Assuming user ID is available after authentication

    // SQL query to fetch all applications of a student
    const sql = `SELECT * FROM applications WHERE user_id = ?`;

    // Execute the query
    db.all(sql, [userId], (err, rows) => {
        if (err) {
            console.error(err.message);
            res.status(500).send('Internal Server Error');
        } else {
            res.json(rows); // Send the fetched applications as JSON response
        }
    });
});

module.exports = router;
