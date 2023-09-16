import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";

function App() {
  return (
    <div className="container">
      <Header />
      <LeaderBoard />
    </div>
  );
}

function Header() {
  return <h1 className="main-header">Classroom 1</h1>;
}
function LeaderBoard() {
  return (
    <ul>
      <BoardPanel />
      <BoardPanel />
      <BoardPanel />
      <BoardPanel />
    </ul>
  );
}

function BoardPanel() {
  return (
    <>
      <li>
        <img className="avatar"></img>
        <span>Easy</span>
        <span>Medium</span>
        <span>Hard</span>
      </li>
    </>
  );
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
