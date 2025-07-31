import React, { useState } from "react";

interface LoginModalProps {
  intent: "student" | "assist";
  onClose: () => void;
  onLogin: (email: string, password: string, intent: string) => Promise<void>;
  error: string;
  onSwitchIntent: () => void;
  onSignupClick: () => void;
}

const LoginModal: React.FC<LoginModalProps> = ({
  intent,
  onClose,
  onLogin,
  error,
  onSwitchIntent,
  onSignupClick,
}) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    await onLogin(email, password, intent);
    setIsSubmitting(false);
  };

  return (
    <div
      className={`modal ${
        intent === "assist" ? "assistant-modal" : "student-modal"
      }`}
    >
      <div className="modal-content">
        <a href="#" className="close" onClick={onClose}>
          &times;
        </a>
        <div className="modal-header">
          <div className="modal-logo">
            <span className="book-icon">📚</span>STUDY CREW
          </div>
        </div>
        <div className="modal-body">
          <h2>{intent === "assist" ? "Assistant Login" : "Student Login"}</h2>
          <p className="modal-subtitle">
            {intent === "assist"
              ? "Sign in to start helping others"
              : "Sign in to get the help you need"}
          </p>

          {error && <div className="error-message">{error}</div>}

          <form onSubmit={handleSubmit}>
            <input type="hidden" name="intent" value={intent} />

            <div className="form-group">
              <label>Email</label>
              <div className="input-group">
                <span className="input-icon">📧</span>
                <input
                  type="email"
                  name="email"
                  placeholder={`Enter your ${
                    intent === "assist" ? "assistant" : "student"
                  } email`}
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
              </div>
            </div>

            <div className="form-group">
              <label>Password</label>
              <div className="input-group">
                <span className="input-icon">🔒</span>
                <input
                  type="password"
                  name="password"
                  placeholder="Enter your password"
                  required
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>
            </div>

            <button
              type="submit"
              className={`submit-btn ${
                intent === "assist" ? "assistant-btn" : "student-btn"
              }`}
              disabled={isSubmitting}
            >
              <span className="btn-icon">🔑</span>
              {isSubmitting
                ? "Signing In..."
                : `Sign In as ${intent === "assist" ? "Assistant" : "Student"}`}
            </button>

            <p className="signup-link">
              Don't have an account?{" "}
              <a href="#" onClick={onSignupClick}>
                Sign up as {intent === "assist" ? "Assistant" : "Student"}
              </a>
            </p>
            <p className="switch-link">
              <a href="#" onClick={onSwitchIntent}>
                Switch to {intent === "assist" ? "Student" : "Assistant"} Login
              </a>
            </p>
          </form>
        </div>
      </div>
    </div>
  );
};

export default LoginModal;
