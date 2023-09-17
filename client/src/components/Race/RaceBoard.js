import { useState } from "react";
import RacePanel from "./RacePanel";

function RaceBoard({ data }) {
  const playerData = data.playerData;
  const keys = Object.keys(data.playerData);

  return (
    <ul className="raceboard">
      {keys.map((key) => (
        <RacePanel
          image="spaceship.png"
          distance={playerData[key].distancePercentage}
          name="Tuan"
        />
      ))}
      <RacePanel image="spaceship.png" name="Tuan" />
      <RacePanel image="spaceship.png" name="Tyler" />
      <RacePanel image="spaceship.png" name="Johnathon" />
      <RacePanel image="spaceship.png" name="Potatomaster18000" />
    </ul>
  );
}

export default RaceBoard;
