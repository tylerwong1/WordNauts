const express = require("express");

const PORT = process.env.PORT || 3001;

const app = express();

app.use(express.json());

app.get("/api", (req, res) => {
    res.json({ message: "Hello from server!" });
  });

app.post("/api/post-data", (req, res) => {
    // Access POST data in req.body
  const postData = req.body;
  console.log('Received POST data:', postData);
  // You can process the data and send a response here
  res.json({ message: 'Data received successfully' });
});
  
app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});
