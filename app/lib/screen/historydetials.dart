import 'dart:io';

import 'package:flutter/material.dart';
import 'package:storeit/screen/homepage.dart';
import 'package:storeit/screen/profile.dart';

// ignore: must_be_immutable
class Historydetials extends StatelessWidget {
 Homepage? home;
  String? pname;
  String? name;
  String? date;
  String? catogary;
  String? quantity;
  String? price;
  String? address;
  String? image;

  Historydetials({
    this.home,
    super.key,
    required this.name,
    required this.pname,
    required this.catogary,
    required this.date,
    required this.price,
    required this.quantity,
    required this.address,
    required this.image,
  });



  @override
  Widget build(BuildContext context) {
    int? intPrice = int.parse(price!);
    int? intQuantity = int.parse(quantity!);
    int? totalPrice = intPrice*intQuantity+2000+500+1000-1000;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'shipping details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(File(image!))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Shipping Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "To $name,",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "$address",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Date :$date",
              style: style(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$pname',
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              'Catogary : $catogary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Quantity : $quantity',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Total Price : ${totalPrice}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
