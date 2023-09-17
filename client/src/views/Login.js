import React from "react";
import Navbar from "../components/Login/NavBar";
import Form from "../components/Login/Form";
import "../components/Login/login.css";

const Login = () => {
  const prom = fetch("/api/post-data");
  console.log(prom);
  return (
    <div className="login">
      <Navbar />
      <Form />
    </div>
  );
};

export default Login;
