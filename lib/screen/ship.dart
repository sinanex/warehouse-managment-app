import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse/screen/orderDetils.dart';
import 'package:warehouse/screen/profile.dart';
import 'package:warehouse/widgets/widget.dart';

// ignore: must_be_immutable
class Shppingpage extends StatelessWidget {
  String? pname;
  dynamic image;
  String? price;
  String? quantity;
  String? date;
  String?  color;
  String? catogary;
  String? decs;
  int index;
  Shppingpage({
    super.key,
    required this.pname,
    required this.image,
    required this.price,
    required this.catogary,
    required this.color,
    required this.date,
    required this.decs,
    required this.quantity,
    required this.index,
  });
  final TextEditingController _cnameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _shipping = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _discount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "shipping",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: Image.file(File(image!)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                pname!,
                style: style(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "recipent info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            contextfeild(hindtext: 'customer name', controllertext: _cnameCtrl),
            contextfeild(hindtext: 'phone number', controllertext: _emailCtrl),
            contextfeild(hindtext: 'Location', controllertext: _location),
            contextfeild(
                hindtext: 'shipping address', controllertext: _shipping),
            contextfeild(hindtext: 'quantity', controllertext: _quantity),
            contextfeild(hindtext: 'discount', controllertext: _discount),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                nextBtn(context);
              },
              child: Center(
                child: GestureDetector(
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: const Center(
                      child: Text(
                        "next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextBtn(BuildContext context) {
    final name = _cnameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final location = _location.text.trim();
    final address = _shipping.text.trim();
    final quantity = _quantity.text.trim();
    final discount = _discount.text.trim();

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        location.isNotEmpty &&
        address.isNotEmpty &&
        discount.isNotEmpty &&
        quantity.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderdetilsPage(
                catogary: catogary,
                color: color,
                date: date,
                desc: decs,
                totalQuantity: quantity,
                index: index,
                    name: name,
                    email: email,
                    location: location,
                    shpping: address,
                    quantity: quantity,
                    price: price,
                    pname: pname,
                    image: image,
                    discount: discount,
                  )));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("fill all the feild")));
    }
  }
}
