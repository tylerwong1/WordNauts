import { Routes, Route } from 'react-router-dom';
import Login from './views/Login'; 
//import LeaderBoard from './components/Leaderboard';

import RaceBoard from "./components/Race/RaceBoard";

function App() {
    return (
        <>
        <Routes>
            <Route path ="/" element={<Login />} />
            {/* <Route path="/" /> */}
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

  
  