const mongoose = require("mongoose");

 mongoose
  .connect("mongodb://localhost:27017/users")
  .then(() => {
    console.log("db conncted success");
  })
  .catch((err) => console.log("db connection error", err));


module.exports = mongoose