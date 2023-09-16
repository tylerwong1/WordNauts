import { useState } from "react";
import RacePanel from "./RacePanel";

function RaceBoard() {
  return (
    <ul className="raceboard">
      <RacePanel image="spaceship.png" name="Tuan" />
      <RacePanel image="spaceship.png" name="Tyler" />
      <RacePanel image="spaceship.png" name="Johnathon" />
      <RacePanel image="spaceship.png" name="Potatomaster18000" />
    </ul>
  );
}

export default RaceBoard;
