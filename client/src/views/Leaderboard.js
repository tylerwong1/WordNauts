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
    "https://tr.rbxcdn.com/ba25df0ac4164d0dd3abfd7b745b44cf/60/60/AvatarHeadshot/Png",
    "https://tr.rbxcdn.com/5ab93248f6b4e8e1ca4fb608d3a7305d/60/60/AvatarHeadshot/Png",
    "https://tr.rbxcdn.com/cdc357c46840030c72f842fe72671e91/60/60/AvatarHeadshot/Png",
    "https://tr.rbxcdn.com/454667a7d82990993fd68db28d40a568/60/60/AvatarHeadshot/Png",
  ];
  return (
    <>
      <Navbar />
      <div className="leaderboard-container">
        <Header />
        <ul className="leaderboard">
          {keys.map((key, i) => (
            <BoardPanel
              image={imgs[i]}
              correctNounAnswered={playerData[key].correctNounAnswered}
              nounAnswered={playerData[key].nounAnswered}
              correctVerbAnswered={playerData[key].correctVerbAnswered}
              verbAnswered={playerData[key].verbAnswered}
              correctAdjectiveAnswered={
                playerData[key].correctAdjectiveAnswered
              }
              adjectiveAnswered={playerData[key].adjectiveAnswered}
              percent={[
                (
                  (
                    Number(playerData[key].correctNounAnswered) /
                    Number(playerData[key].nounAnswered)
                  ).toFixed(2) * 100
                ).toFixed(0),
                (
                  (
                    Number(playerData[key].correctVerbAnswered) /
                    Number(playerData[key].verbAnswered)
                  ).toFixed(2) * 100
                ).toFixed(0),
                (
                  (
                    Number(playerData[key].correctAdjectiveAnswered) /
                    Number(playerData[key].adjectiveAnswered)
                  ).toFixed(2) * 100
                ).toFixed(0),
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
