import React from "react";
import Card from "../Card/assistant";
import StudentCard from "../Card/student";
import AssistantCard from "../Card/assistant";


type MainContentProps = {
  user: any;
  onLoginClick: (intent: "student" | "assist") => void;
  onSignupClick: (intent: "student" | "assist") => void;
};

const MainContent: React.FC<MainContentProps> = ({
  user,
  onLoginClick,
  onSignupClick,
}) => (
  <section className="main-container">
    <AssistantCard onLoginClick={onLoginClick} />

    <StudentCard onLoginClick={onLoginClick} />
    {/* Uncomment the following lines if you want to display a welcome message or buttons based on user state */}
    {/* <h2>Welcome to the Main Content</h2>
    {!user && (
      <div>
        <button className="assist-btn" onClick={() => onLoginClick("student")}>
          Login as Student
        </button>
        <button className="assist-btn" onClick={() => onLoginClick("assist")}>
          Login as Assistant
        </button>
        <button
          className="assistance-btn"
          onClick={() => onSignupClick("student")}
        >
          Sign Up as Student
        </button>
        <button
          className="assistance-btn"
          onClick={() => onSignupClick("assist")}
        >
          Sign Up as Assistant
        </button>
      </div>
    )}
    {user && <p>Hello, {user.username}!</p>} */}
  </section>
);

export default MainContent;
