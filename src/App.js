import RaceBoard from "./components/Race/RaceBoard";

function App() {
  return (
    <div className="race-container">
      <LbHeader />
      <RaceBoard />
    </div>
  );
}

export default App;

function LbHeader() {
  return <h1 className="lb-header">Classroom 1</h1>;
}
