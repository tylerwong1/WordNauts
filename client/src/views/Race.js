import Navbar from "../components/Login/NavBar";
import RaceBoard from "../components/Race/RaceBoard";
import "../components/Race/raceboard.css";

function Race({ playerData }) {
  return (
    <>
      <Navbar />
      <div className="race-container">
        <RaceHeader />
        <RaceBoard playerData={playerData} />
      </div>
    </>
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
