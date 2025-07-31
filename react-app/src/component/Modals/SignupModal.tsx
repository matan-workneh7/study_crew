import React, { useState } from "react";
import type { SignupFormData } from "../../types/types";

interface SignupModalProps {
  intent: "student" | "assist";
  onClose: () => void;
  onSignup: (formData: SignupFormData) => Promise<void>;
  error: string;
  onLoginClick: () => void;
}

const SignupModal: React.FC<SignupModalProps> = ({
  intent,
  onClose,
  onSignup,
  error,
  onLoginClick,
}) => {
  const [formData, setFormData] = useState<SignupFormData>({
    username: "",
    email: "",
    password: "",
    confirm_password: "",
    academic_year: "",
    user_role: intent,
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    await onSignup(formData);
    setIsSubmitting(false);
  };

  return (
    <div className="modal" style={{ display: "block" }}>
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
          <h2>Join Study Crew</h2>
          <p className="modal-subtitle">
            Create your account to{" "}
            {intent === "assist"
              ? "start helping others"
              : "get the help you need"}
            .
          </p>

          {error && <div className="error-message">{error}</div>}

          <form onSubmit={handleSubmit}>
            <input type="hidden" name="user_role" value={intent} />

            <div className="form-group">
              <label>Username</label>
              <div className="input-group">
                <span className="input-icon">👤</span>
                <input
                  type="text"
                  name="username"
                  placeholder="Choose a username"
                  required
                  value={formData.username}
                  onChange={handleChange}
                />
              </div>
            </div>

            <div className="form-group">
              <label>Email</label>
              <div className="input-group">
                <span className="input-icon">📧</span>
                <input
                  type="email"
                  name="email"
                  placeholder="Enter your email"
                  required
                  value={formData.email}
                  onChange={handleChange}
                />
              </div>
            </div>

            <div className="form-group">
              <label>Academic Year</label>
              <div className="input-group">
                <span className="input-icon">🎓</span>
                <select
                  name="academic_year"
                  required
                  value={formData.academic_year}
                  onChange={handleChange}
                >
                  <option value="">Select your academic year</option>
                  <option value="Freshman">Freshman (1st Year)</option>
                  <option value="Sophomore">Sophomore (2nd Year)</option>
                  <option value="Junior">Junior (3rd Year)</option>
                  <option value="Senior">Senior (4th Year)</option>
                  <option value="Graduate">Graduate</option>
                </select>
              </div>
            </div>

            <div className="form-group">
              <label>Password (min 6 characters)</label>
              <div className="input-group">
                <span className="input-icon">🔒</span>
                <input
                  type="password"
                  name="password"
                  placeholder="Create a password"
                  minLength={6}
                  required
                  value={formData.password}
                  onChange={handleChange}
                />
              </div>
            </div>

            <div className="form-group">
              <label>Confirm Password</label>
              <div className="input-group">
                <span className="input-icon">🔒</span>
                <input
                  type="password"
                  name="confirm_password"
                  placeholder="Confirm your password"
                  minLength={6}
                  required
                  value={formData.confirm_password}
                  onChange={handleChange}
                />
              </div>
            </div>

            <button
              type="submit"
              className="submit-btn"
              disabled={isSubmitting}
            >
              <span className="btn-icon">📝</span>
              {isSubmitting ? "Creating Account..." : "Create Account"}
            </button>

            <p className="login-link">
              Already have an account?{" "}
              <a href="#" onClick={onLoginClick}>
                Sign in
              </a>
            </p>
          </form>
        </div>
      </div>
    </div>
  );
};

export default SignupModal;
