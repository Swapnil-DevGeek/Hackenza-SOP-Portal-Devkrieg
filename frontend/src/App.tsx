import { useState } from "react";
import { GoogleLogin } from "@react-oauth/google";
import { jwtDecode } from "jwt-decode";

const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [userName, setUserName] = useState("");

  //@ts-ignore
  const handleSuccess = async (credentialResponse) => {
    const { credential } = credentialResponse;
    console.log("Credential:", credential);

    // Decode the JWT token
    const decodedToken = jwtDecode(credential);
    console.log("Decoded Token:", decodedToken);

    // Access user information from the decoded token
    //@ts-ignore
    const { email, name } = decodedToken;

    // Update state
    setIsLoggedIn(true);
    setUserName(name);

    // Now you can use the extracted user information as needed
    console.log("Email:", email);
    console.log("Name:", name);
  };

  const handleError = () => {
    console.log('Login Failed!');
  };

  const handleLogout = () => {
    // Clear any user data or tokens
    setIsLoggedIn(false);
    setUserName("");
    console.log('Logged out!');
  };

  return (
    <div className="flex h-screen justify-center items-center">
      {isLoggedIn ? (
        <div>
          <p>Welcome {userName}</p>
          <button onClick={handleLogout}>Logout</button>
        </div>
      ) : (
        <GoogleLogin
          onSuccess={handleSuccess}
          onError={handleError}
        />
      )}
    </div>
  );
};

export default App;
