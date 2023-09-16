import { useState } from "react";
import { IconContext } from "react-icons";
import { IoIosArrowDown } from "react-icons/io";

function BoardPanel({ image }) {
  const [isOpen, setIsOpen] = useState(false);
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
