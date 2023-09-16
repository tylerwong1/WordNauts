import { Routes, Route } from 'react-router-dom';
import Login from './views/Login'; 
import Race from './views/Race';
import Leaderboard from './views/Leaderboard';

function App() {
    return (
        <>
        <Routes>
            <Route path ="/" element={<Login />} />
            <Route path="/race" element={<Race />} />
            <Route path="/leaderboard" element={<Leaderboard />} />
        </Routes>
        </>
    //   <div className="container">
    //     <Header />
    //     <LeaderBoard />
    //   </div>
    );
  };

  export default App;
  
  function Header() {
    return <h1 className="main-header">Classroom 1</h1>;
  }

  
  