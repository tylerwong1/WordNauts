import React from "react";
function Navbar() {
  console.log("test");
  return (
    <nav className="navbar">
      <div className="navbar-logo">
        <a href="#">
          <img className="navbar-logo" src="logo.png"></img>
        </a>
      </div>
      <ul className="navbar-links">
        <li>
          <a className="navbar-link" href="/">
            Home
          </a>
        </li>
        <li>
          <a className="navbar-link" href="/leaderboard">
            Leaderboard
          </a>
        </li>
        <li>
          <a className="navbar-link" href="/race">
            Race
          </a>
        </li>
      </ul>
    </nav>
  );
}

export default Navbar;
