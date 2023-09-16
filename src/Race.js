import RaceBoard from "./components/Race/RaceBoard";
import "./raceboard.css";

function Race() {
  return (
    <div className="race-container">
      <RaceHeader />
      <RaceBoard />
    </div>
  );
}

export default Race;

function RaceHeader() {
  return <h1 className="race-header">Race Status</h1>;
}
