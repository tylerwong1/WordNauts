import Navbar from "../components/Login/NavBar";
import BoardPanel from "../components/Leaderboard/BoardPanel";
import "../components/Leaderboard/leaderboard.css";

function LeaderBoard() {
  return (
    <>
      <Navbar />
      <div className="leaderboard-container">
        <Header />
        <ul className="leaderboard">
          <BoardPanel image="test.jpg" percent={[54, 32, 78]} />
          <BoardPanel image="test.jpg" percent={[54, 32, 78]} />
          <BoardPanel image="test.jpg" percent={[54, 32, 78]} />
          <BoardPanel image="test.jpg" percent={[54, 32, 78]} />
        </ul>
      </div>
    </>
  );
}

function Header() {
  return <h1 className="lb-header">Classroom 1</h1>;
}

export default LeaderBoard;
