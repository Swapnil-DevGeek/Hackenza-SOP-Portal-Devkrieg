const axios = require('axios');
const dotenv = require('dotenv');
dotenv.config();

const {AUTH_DOMAIN,AUTH_CLIENT_ID,AUTH_CLIENT_SECRET} = process.env;

const login = async (req, res) => {
    try {
      const { code } = req.body;
      
      // Exchange the authorization code for an access token
      const tokenResponse = await axios.post(`https://${AUTH_DOMAIN}/oauth/token`, {
        grant_type: 'authorization_code',
        client_id: AUTH_CLIENT_ID,
        client_secret: AUTH_CLIENT_SECRET,
        code,
        redirect_uri: 'http://localhost:3000/callback', // Replace with your callback URL
      });
  
    
      const accessToken = tokenResponse.data.access_token;
      res.json({ accessToken });
    } catch (error) {
      console.error('Error logging in:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  };

  
  
  module.exports = {
    login,
  };