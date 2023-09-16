import React from "react";

const Navbar = () => {
    console.log("test")
    return (
      <nav className="navbar">
        <div className="navbar-logo">
          <a href="/">Logo</a>
        </div>
        <ul className="navbar-links">
          <li><a href="/">Home</a></li>
          <li><a href="/about">About</a></li>
          <li><a href="/services">Services</a></li>
          <li><a href="/contact">Contact</a></li>
        </ul>
      </nav>
    );
  };

export default Navbar;