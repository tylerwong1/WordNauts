import RaceBoard from "../components/Race/RaceBoard";
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
  return (
    <div className="race-heading">
      <h1 className="race-header">Race Status</h1>;
      <h1 className="race-header">Time Remaining 00:00</h1>
    </div>
  );
}
