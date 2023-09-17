import React from "react";
import Navbar from "../components/Login/NavBar";
import BoardPanel from "../components/Leaderboard/BoardPanel";
import "../components/Leaderboard/leaderboard.css";
import { useEffect } from "react";

function LeaderBoard(props) {
  if (props.playerData === 5) return;
  console.log(props);
  const playerData = props.playerData;
  console.log(playerData);
  const keys = Object.keys(playerData);
  const imgs = [
    "https://tr.rbxcdn.com/bddd7ae384bcba73ad85ed8d54d3b778/60/60/AvatarHeadshot/Png",
  ];
  return (
    <>
      <Navbar />
      <div className="leaderboard-container">
        <Header />
        <ul className="leaderboard">
          {keys.map((key) => (
            <BoardPanel
              image="test.jpg"
              percent={[
                (
                  Number(playerData[key].correctNounAnswered) /
                  Number(playerData[key].nounAnswered)
                ).toFixed(2) * 100,
                (
                  Number(playerData[key].correctVerbAnswered) /
                  Number(playerData[key].verbAnswered)
                ).toFixed(2) * 100,
                (
                  Number(playerData[key].correctAdjectiveAnswered) /
                  Number(playerData[key].adjectiveAnswered)
                ).toFixed(2) * 100,
              ]}
            />
          ))}
        </ul>
      </div>
    </>
  );
}

function Header() {
  return <h1 className="lb-header">Classroom 1</h1>;
}

export default LeaderBoard;
