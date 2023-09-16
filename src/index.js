import React from "react";
import ReactDOM from "react-dom/client";
import { useState } from "react";
import { IconContext } from "react-icons";
import { IoIosArrowDown } from "react-icons/io";

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
    <ul className="leaderboard">
      <BoardPanel image="test.jpg" />
      <BoardPanel image="test.jpg" />
      <BoardPanel image="test.jpg" />
      <BoardPanel image="test.jpg" />
    </ul>
  );
}

function BoardPanel({ image }) {
  const percents = [56, 33, 99];
  const [isOpen, setIsOpen] = useState(false);
  return (
    <>
      <div className="panel">
        <li className="panel-info">
          <img
            className="avatar"
            src={image}
            alt="Image of in-game avatar"
          ></img>
          <span>Noun {percents[0]}%</span>
          <span>Verb {percents[1]}%</span>
          <span>Adjectives {percents[2]}%</span>
        </li>
        <IconContext.Provider value={{ size: "2.4rem" }}>
          <div
            className={`icon ${isOpen ? "active" : ""}`}
            onClick={() => setIsOpen(!isOpen)}
          >
            <IoIosArrowDown />
          </div>
        </IconContext.Provider>
      </div>
    </>
  );
}
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
