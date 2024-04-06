const express= require('express');
const bodyParser = require('body-parser');
const authController = require('./controllers/authController');
const determineUserRole = require('./middleware/roleMiddleware');
const {studentRoutes,facultyRoutes,adminRoutes} = require('./routes');
require('dotenv').config();

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//routes 
app.use('/api',determineUserRole); //role based middleware for all routes

app.use('/api', determineUserRole);

// Routes for specific roles
app.use('/api/student', studentRoutes);
app.use('/api/faculty', facultyRoutes);
app.use('/api/admin', adminRoutes);

app.post('/login', authController.login);

const PORT = process.env.PORT || 3000;
app.listen(PORT,()=>{
console.log(`Server is running on port ${PORT}`);
})