import RacePanel from "./RacePanel";

function RaceBoard() {
  return (
    <ul className="raceboard">
      <RacePanel image="spaceship.png" />
      <RacePanel image="spaceship.png" />
      <RacePanel image="spaceship.png" />
      <RacePanel image="spaceship.png" />
    </ul>
  );
}

export default RaceBoard;
