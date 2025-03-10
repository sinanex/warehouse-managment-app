const express = require("express");

const mongoose = require("./config/db");
const userRouts = require("./routs/userRouts");
const prodcutRouts  =require('./routs/product')
const app = express();
app.use(express.json());
app.use("/users", userRouts);
app.use("/products",prodcutRouts)


app.get("/", (req, res) => {
  res.send("server running success");
});
app.listen(9000, () => console.log("server running"));
