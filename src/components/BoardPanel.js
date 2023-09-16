import { useState } from "react";
import { IconContext }  from "react-icons";
import { IoIosArrowDown } from "react-icons/io"

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
              alt="in-game avatar"
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
  
  export default BoardPanel;

