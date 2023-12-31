import { useState } from "react";
import { IconContext } from "react-icons";
import { IoIosArrowDown } from "react-icons/io";

function BoardPanel({
  image,
  correctNounAnswered,
  nounAnswered,
  correctVerbAnswered,
  verbAnswered,
  correctAdjectiveAnswered,
  adjectiveAnswered,
  percent,
}) {
  const [isOpen, setIsOpen] = useState(false);
  console.log(percent);
  return (
    <>
      <div className="board-panel">
        <li className="board-panel-info">
          <img className="avatar" src={image} alt="in-game avatar"></img>
          <span style={{ color: `${percent[0] > 65 ? "green" : "red"}` }}>
            Nouns {percent[0]}%
          </span>
          <span style={{ color: `${percent[1] > 65 ? "green" : "red"}` }}>
            Verbs {percent[1]}%
          </span>
          <span style={{ color: `${percent[2] > 65 ? "green" : "red"}` }}>
            Adjectives {percent[2]}%
          </span>
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

      <div className={`drop-down ${isOpen ? "" : "hidden"}`}>
        <li className="board-panel-info">
          <span style={{ color: `${percent[0] > 65 ? "green" : "red"}` }}>
            Nouns {`${correctNounAnswered} / ${nounAnswered}`}
          </span>
          <span style={{ color: `${percent[1] > 65 ? "green" : "red"}` }}>
            Verbs {`${correctVerbAnswered} / ${verbAnswered}`}
          </span>
          <span style={{ color: `${percent[2] > 65 ? "green" : "red"}` }}>
            Adjectives {`${correctAdjectiveAnswered} / ${adjectiveAnswered}`}
          </span>
        </li>
      </div>
    </>
  );
}

export default BoardPanel;
