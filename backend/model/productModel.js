const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  name: { type: String, required: true },
  price: { type: Number, required: true },
  color: { type: String, required: true },
  description: { type: String, required: true },
  catogary: { type: String, required: true },
  quantity: { type: String, required: true },
  date: { type: String, required: true },
  image: { type: String, required: true },
});

module.exports = mongoose.model("Product", productSchema);
