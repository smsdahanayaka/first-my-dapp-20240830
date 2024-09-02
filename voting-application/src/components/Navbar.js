import React from "react";

function Navbar({ account }) {
  return (
    <nav className="navbar navbar-dark bg-dark">
      <span className="navbar-brand mb-0 h1">Voting DApp</span>
      <span className="navbar-text">Account: {account}</span>
    </nav>
  );
}

export default Navbar;
