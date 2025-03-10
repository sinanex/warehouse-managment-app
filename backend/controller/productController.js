const productModel = require("../model/productModel"); 
exports.getProduct = async (req, res) => {
  try {
    const products = await productModel.find(); 
    return res.json(products);
  } catch (error) {
    return res.status(500).send({ message: error.message });
  }
};

exports.addProduct = async (req,res)=>{
    try {
        const {name,price,color,date,image,quantity,catogary,description} =req.body;
         const productData = new productModel({name,price,color,date,image,quantity,catogary,description});

       await productData.save();
      return res.send({message :"data added successs",productData})
    } catch (error) {
       return res.status(500).send({message : error.message}) 
    }
}

exports.updateProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, price } = req.body;

    const updatedProduct = await productModel.findByIdAndUpdate(
      id,
      { name, price },
      { new: true, runValidators: true }
    );

    if (!updatedProduct) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.status(200).json({ message: "Product updated successfully", updatedProduct });
  } catch (error) {
    res.status(500).json({ message: "Internal Server Error", error: error.message });
  }
};


exports.deleteProduct = async(req,res) => {
  try {
    const {id} = req.params;
    const deleteProduct = await productModel.findByIdAndDelete(id);
    if(!deleteProduct){
      return res.status(204).send({message :"product not found"})
    }

    return res.status(200).send({message :" item deleted success"})
  } catch (error) {
    return res.status(500).send({message : error.message})
  }
};