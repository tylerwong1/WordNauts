import React from "react";
import Navbar from "../components/Login/NavBar";
import Form from "../components/Login/Form";
import "../components/Login/login.css";
import { io } from "socket.io-client";

const Login = () => {
  const [time, setTime] = React.useState("fetching");
  React.useEffect(() => {
    const socket = io("http://localhost:3003");

    socket.on("connect", () => console.log(socket.id));
    socket.on("connect_error", () => {
      setTimeout(() => socket.connect(), 3003);
    });
    socket.on("json", (data) => console.log(data));
    socket.on("disconnect", () => setTime("server disconnected"));
  }, []);

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
