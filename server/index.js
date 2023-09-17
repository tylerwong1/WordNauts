const express = require("express");
const socketIo = require("socket.io");
const http = require("http");

const PORT = process.env.PORT || 3001;

const app = express();
const server = http.createServer(app);

const io = socketIo(server, {
  cors: {
    origin: "http://localhost:3000",
  },
});

io.on("connection", (socket) => {
  console.log("client connected: ", socket.id);

  socket.join("clock-room");

  socket.on("disconnect", (reason) => {
    console.log(reason);
  });
});

server.listen(3003, (err) => {
  if (err) console.log(err);
  console.log("Server running on Port ", 3003);
});

app.use(express.json());

app.get("/api", (req, res) => {
  res.json({ message: "Hello from server!" });
});

app.post("/api/post-data", (req, res) => {
  // Access POST data in req.body
  const postData = req.body;
  console.log("Received POST data:", postData);
  io.to("clock-room").emit("json", postData);
  // You can process the data and send a response here
  res.json({ message: "Data received successfully" });
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});
