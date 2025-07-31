import React from "react";

type Student = {
  onLoginClick: (intent: "student" | "assist") => void;
};

const StudentCard: React.FC<Student> = ({ onLoginClick }) => {
  return (
    <div className="card-container">
      <div className="card-icon">💡</div>
      <h2>Find a Tutor</h2>
      <p>
        Get personalized help from top students who've aced the courses you're
        taking. Schedule sessions at your convenience and receive targeted
        support for your specific challenges.
      </p>

      <button className="card-btn" onClick={() => onLoginClick("student")}>
        <span>I am looking for an assistance</span>
      </button>
    </div>
  );
};

export default StudentCard;
