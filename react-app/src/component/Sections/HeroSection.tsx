import React from "react";

type HeroSectionProps = {
  user: any;
  onSignupClick: () => void;
};

const HeroSection: React.FC<HeroSectionProps> = ({ user, onSignupClick }) => (
  <section className="hero">
    <div className="hero-content">
      <h1>
        Welcome to <span className="highlight">Study-crew</span>
      </h1>
      <p>Your journey to learning starts here.</p>
      {!user && (
        <button className="get-started-btn" onClick={onSignupClick}>
          Get Started
        </button>
      )}
    </div>
  </section>
);

export default HeroSection;
