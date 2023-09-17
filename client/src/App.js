import React from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./views/Login";
import Race from "./views/Race";
import Leaderboard from "./views/Leaderboard";
import { io } from "socket.io-client";

function App() {
  const [playerData, setPlayerData] = React.useState(5);
  React.useEffect(() => {
    const socket = io("http://localhost:3003");

    socket.on("connect", () => console.log(socket.id));
    socket.on("connect_error", () => {
      setTimeout(() => socket.connect(), 3003);
    });
    socket.on("json", function (data) {
      console.log(data);
      return setPlayerData(data.playerData);
    });
    console.log(`omg ${playerData}`);
    socket.on("disconnect", () => console.log("client disconnected"));
  }, []);
  return (
    <>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/race" element={<Race playerData={playerData} />} />
        <Route
          path="/leaderboard"
          element={<Leaderboard playerData={playerData} />}
        />
      </Routes>
    </>
    //   <div className="container">
    //     <Header />
    //     <LeaderBoard />
    //   </div>
  );
}

export default App;
