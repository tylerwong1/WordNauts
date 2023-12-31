const express = require("express");
const socketIo = require("socket.io");
const http = require("http");
const path = require('path');
const PORT = process.env.PORT || 3001;

const app = express();
const server = http.createServer(app);

const io = socketIo(server, {
  cors: {
    origin: "http://localhost:3001",
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
  console.log("Socket running on Port ", 3003);
});

const _dirname = path.dirname("");
const buildPath = path.join(_dirname, "../client/build");

app.use(express.static(buildPath));
app.use(express.json());

app.get("/*", function(req, res) {
    res.sendFile(
      path.join(__dirname, "../client/build/index.html"),
      function(err) {
        if (err) {
          res.status(500).send(err);
        }
      }
    )
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
