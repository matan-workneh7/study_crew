import React from "react";

type SuccessBannerProps = {
  message: string;
};

const SuccessBanner: React.FC<SuccessBannerProps> = ({ message }) => (
  <div className="success-banner">
    <p>{message}</p>
  </div>
);

export default SuccessBanner;
