import LeaderBoard from './components/Leaderboard';

function App() {
    return (
      <div className="container">
        <Header />
        <LeaderBoard />
      </div>
    );
  }
  
  export default App;
  
  function Header() {
    return <h1 className="main-header">Classroom 1</h1>;
  }

  
  