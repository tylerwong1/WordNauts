import React from "react";

function BoardPanel({ image }) {
  return (
    <>
      <div className="race-panel">
        <li className="panel-info">
          <img className="spaceship" src={image} alt="in-game avatar"></img>
        </li>
      </div>
    </>
  );
}

export default BoardPanel;
