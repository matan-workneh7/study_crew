import React from "react";

type HeaderProps = {
  user: any;
  onLogout: () => Promise<void>;
};

const Header: React.FC<HeaderProps> = ({ user, onLogout }) => (
  <header className="header">
    <div className="container">
      <a href="#" className="logo">
        <span className="book-icon">📚</span>Study-Crew
      </a>
      <nav>
        <ul>
          <li>
            <a href="">Home</a>
          </li>
          <li>
            <a href="#">About</a>
          </li>
        </ul>
      </nav>
      <div className="user-menu">
        {user && <span>{user.username}</span>}
        {user && (
          <button className="sign-in-btn" onClick={onLogout}>
            Logout
          </button>
        )}
      </div>
    </div>
  </header>
);

export default Header;
