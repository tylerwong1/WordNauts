import { useState } from "react";
import { IconContext } from "react-icons";
import { IoIosArrowDown } from "react-icons/io";

function RacePanel({ image, distance, name }) {
  return (
    <>
      <div className="race-panel">
        <li className="panel-info">
          <img
            className="spaceship"
            style={{ transform: `translateX(${distance}rem)` }}
            src={image}
            alt="in-game avatar"
          ></img>
          <p className="race-name">{name}</p>
        </li>
      </div>
    </>
  );
}

export default RacePanel;
