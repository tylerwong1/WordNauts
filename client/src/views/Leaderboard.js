import Navbar from "../components/Login/NavBar";
import BoardPanel from "../components/Leaderboard/BoardPanel";
import "../components/Leaderboard/leaderboard.css";

function LeaderBoard({ data }) {
  const playerData = data.playerData;
  const keys = Object.keys(data.playerData);
  return (
    <>
      <Navbar />
      <div className="leaderboard-container">
        <Header />
        <ul className="leaderboard">
          {keys.map((key) => (
            <BoardPanel
              image="test.jpg"
              percent={[
                Math.round(
                  Number(playerData[key].correctNounAnswered) /
                    Number(playerData[key].nounAnswered)
                ),
                Math.round(
                  Number(playerData[key].correctVerbAnswered) /
                    Number(playerData[key].verbAnswered)
                ),
                Math.round(
                  Number(playerData[key].correctAdjectiveAnswered) /
                    Number(playerData[key].adjectiveAnswered)
                ),
              ]}
            />
          ))}
        </ul>
      </div>
    </>
  );
}

function Header() {
  return <h1 className="lb-header">Classroom 1</h1>;
}

export default LeaderBoard;
