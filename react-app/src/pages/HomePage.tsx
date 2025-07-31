import React, { useState } from "react";
import Header from "../component/Header";
import Footer from "../component/Footer";
import HeroSection from "../component/Sections/HeroSection";
import Strugle from "../component/strugle/Strugle";
import MainContent from "../component/Sections/MainContent";
import WhyChooseSection from "../component/Sections/WhyChooseSection";
import LoginModal from "../component/Modals/LoginModal";
import SignupModal from "../component/Modals/SignupModal";
import SuccessBanner from "../component/Modals/SuccessBanner";
import type { User, SignupFormData } from "../types/types";

interface HomePageProps {
  user: User | null;
  onLogin: (email: string, password: string, intent: string) => Promise<void>;
  onSignup: (formData: SignupFormData) => Promise<void>;
  onLogout: () => Promise<void>;
  error: string;
  successMessage: string;
}

const HomePage: React.FC<HomePageProps> = ({
  user,
  onLogin,
  onSignup,
  onLogout,
  error,
  successMessage,
}) => {
  const [showLoginModal, setShowLoginModal] = useState(false);
  const [showSignupModal, setShowSignupModal] = useState(false);
  const [intent, setIntent] = useState<"student" | "assist">("student");

  const handleLoginClick = (userIntent: "student" | "assist") => {
    setIntent(userIntent);
    setShowLoginModal(true);
  };

  const handleSignupClick = (userIntent: "student" | "assist") => {
    setIntent(userIntent);
    setShowSignupModal(true);
  };

  return (
    <div className="home-page">
      <Header user={user} onLogout={onLogout} />
      {successMessage && <SuccessBanner message={successMessage} />}
      <HeroSection
        user={user}
        onSignupClick={() => handleSignupClick("student")}
      />
      <Strugle />
      <MainContent
        user={user}
        onLoginClick={handleLoginClick}
        onSignupClick={handleSignupClick}
      />
      <WhyChooseSection />
      <Footer />
      {showLoginModal && (
        <LoginModal
          intent={intent}
          onClose={() => setShowLoginModal(false)}
          onLogin={onLogin}
          error={error}
          onSwitchIntent={() =>
            setIntent(intent === "student" ? "assist" : "student")
          }
          onSignupClick={() => {
            setShowLoginModal(false);
            setShowSignupModal(true);
          }}
        />
      )}
      {showSignupModal && (
        <SignupModal
          intent={intent}
          onClose={() => setShowSignupModal(false)}
          onSignup={onSignup}
          error={error}
          onLoginClick={() => {
            setShowSignupModal(false);
            setShowLoginModal(true);
          }}
        />
      )}
    </div>
  );
};

export default HomePage;
