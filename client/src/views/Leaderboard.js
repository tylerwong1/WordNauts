import BoardPanel from "../components/Leaderboard/BoardPanel";
import "../components/Leaderboard/leaderboard.css" 

function LeaderBoard() {
  return (
    <div className="leaderboard-container">
      <Header />
      <ul className="leaderboard">
        <BoardPanel image="test.jpg" />
        <BoardPanel image="test.jpg" />
        <BoardPanel image="test.jpg" />
        <BoardPanel image="test.jpg" />
      </ul>
    </div>
  );
}

function Header() {
  return <h1 className="lb-header">Classroom 1</h1>;
}

export default LeaderBoard;
