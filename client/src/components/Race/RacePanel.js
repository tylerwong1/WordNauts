import { useState } from "react";
import { IconContext } from "react-icons";
import { IoIosArrowDown } from "react-icons/io";

function RacePanel({ image, name }) {
  const [distanceForward, setDistanceForward] = useState(0);
  return (
    <>
      <div className="race-panel">
        <li className="panel-info">
          <img
            className="spaceship"
            onClick={() => setDistanceForward(distanceForward + 5)}
            style={{ transform: `translateX(${distanceForward}rem)` }}
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
