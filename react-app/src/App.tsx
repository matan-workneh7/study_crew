import React, { useState, useEffect } from "react";
import HomePage from "./pages/HomePage";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import type { User, SignupFormData } from "./types/types";
// import CoursesPage from "./pages/CoursesPage";
// import AssistantDashboard from "./pages/AssistantDashboard";

const App = () => {
  const [user, setUser] = useState<User | null>(null);
  const [error, setError] = useState<string>("");
  const [successMessage, setSuccessMessage] = useState<string>("");

  // Check for existing session on load
  useEffect(() => {
    const checkSession = async () => {
      try {
        // Implement session check with your backend
        // const response = await authService.checkSession();
        // if (response.user) setUser(response.user);
      } catch (err) {
        console.error("Session check failed:", err);
      }
    };
    checkSession();
  }, []);

  const handleLogin = async (
    email: string,
    password: string,
    intent: string
  ) => {
    try {
      // const response = await authService.login(email, password, intent);
      // setUser(response.user);
      // Redirect based on role
    } catch (err) {
      const error = err as Error;
      setError(error.message);
    }
  };

  const handleSignup = async (formData: SignupFormData) => {
    try {
      // const response = await authService.signup(formData);
      // setUser(response.user);
      setSuccessMessage("Registration successful!");
      // Redirect based on role
    } catch (err) {
      const error = err as Error;
      setError(error.message);
    }
  };

  const handleLogout = async () => {
    try {
      // await authService.logout();
      setUser(null);
    } catch (err) {
      const error = err as Error;
      console.error("Logout failed:", error);
    }
  };

  return (
    <Router>
      <Routes>
        <Route
          path="/"
          element={
            <HomePage
              user={user}
              onLogin={handleLogin}
              onSignup={handleSignup}
              onLogout={handleLogout}
              error={error}
              successMessage={successMessage}
            />
          }
        />
        {/* <Route path="/courses" element={<CoursesPage user={user} />} /> */}
        {/* <Route
          path="/assistant-dashboard"
          element={<AssistantDashboard user={user} />}
        /> */}
      </Routes>
    </Router>
  );
};

export default App;
