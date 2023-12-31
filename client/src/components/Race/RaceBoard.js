import { useState } from "react";
import RacePanel from "./RacePanel";

function RaceBoard(props) {
  if (props.playerData === 5) return;
  console.log(props);
  const playerData = props.playerData;
  console.log(playerData);
  const keys = Object.keys(playerData);

  return (
    <ul className="raceboard">
      {keys.map((key) => (
        <RacePanel
          image="spaceship.png"
          distance={
            playerData[key].distancePercentage <= 70
              ? playerData[key].distancePercentage
              : 70
          }
          name={`${key}`}
        />
      ))}
    </ul>
  );
}

export default RaceBoard;
