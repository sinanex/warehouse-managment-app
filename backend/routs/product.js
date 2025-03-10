const productController = require('../controller/productController')
const express = require('express')

const routs = express.Router();


routs.get('/',productController.getProduct);
routs.post('/add',productController.addProduct)
routs.put('/update/:id',productController.updateProduct)
routs.delete('/delete/:id',productController.deleteProduct)
module.exports  =routs;