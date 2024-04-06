import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import { GoogleOAuthProvider } from '@react-oauth/google'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <GoogleOAuthProvider clientId='937968331089-d37mujrmgn762e2bhun3u1j0n0qv4jr2.apps.googleusercontent.com'>
    <React.StrictMode>
        <App />
    </React.StrictMode>
  </GoogleOAuthProvider>
)
