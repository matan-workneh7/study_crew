import React from "react";
type assist = {
  onLoginClick: (intent: "student" | "assist") => void;
};

const AssistantCard: React.FC<assist> = ({ onLoginClick }) => {
  return (
    <div className="card-container">
      <div className="card-icon">🔗</div>
      <h2>Become a tutor</h2>
      <p>
        Reinforce your knowledge by teaching others. Set your own schedule, earn
        recognition, and make a real impact on your peers' academic journey.
        Perfect for students who excel in specific subjects.
      </p>

      <button className="card-btn" onClick={() => onLoginClick("assist")}>
        <span>I am herer to assist others</span>
      </button>
    </div>
  );
};

export default AssistantCard;
