import React from "react";

const WhyChooseSection: React.FC = () => (
  <section className="why-choose">
    <h2>Why Choose Us?</h2>
    <p className="subtitle">
      We provide a collaborative and supportive environment for students to
      thrive academically.
    </p>
    <ul className="features">
      <li className="feature">
        <div className="feature-icon blue">👥</div>
        Expert instructors
        <p>
          Connect with students who understand your coursework and challenges.
        </p>
      </li>
      <li className="feature">
        <div className="feature-icon green">⏰</div>
        Flexible learning
        <p>Find help or offer assistance at times that work for you.</p>
      </li>
      <li className="feature">
        <div className="feature-icon purple">🛡️</div>
        Community support
        <p>
          A secure platform connecting students from your own campus community.
        </p>
      </li>
    </ul>
  </section>
);

export default WhyChooseSection;
