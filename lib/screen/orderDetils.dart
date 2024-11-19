import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/databases/functions/function.dart';
import 'package:warehouse/databases/model/model.dart';
import 'package:warehouse/databases/model/shipping.dart';
import 'package:warehouse/screen/bottomNavigation.dart';
import 'package:warehouse/screen/profile.dart';

String? year = DateFormat('yyyy-MM-dd').format(DateTime.now());

// ignore: must_be_immutable
class OrderdetilsPage extends StatelessWidget {
  String? name;
  String? email;
  String? location;
  String? shpping;
  String? quantity;
  String? price;
  String? pname;
  String? image;
  String? discount;
  int? index;
  String? totalQuantity;
  String? desc;
  String? color;
  String? catogary;
  String? date;

  OrderdetilsPage({
    super.key,
    required this.totalQuantity,
    required this.index,
    required this.name,
    required this.email,
    required this.location,
    required this.shpping,
    required this.quantity,
    required this.price,
    required this.pname,
    required this.image,
    required this.discount,
    required this.color,
    required this.desc,
    required this.catogary,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "order details",
          style: style(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 77, 225, 203)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset(
                          'assets/images/calendar.png',
                          width: 40,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              year!,
                              style: textstyl(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 10,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Eranakulam",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Container(
                width: 2,
                height: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Iconsax.location,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  location!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "shipping info",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "+91 $email",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          shpping!,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Fee",
                        style: style(),
                      ),
                      Text(
                        "Late Night Surcharge",
                        style: style(),
                      ),
                      Text(
                        "Moving Cart",
                        style: style(),
                      ),
                      Text(
                        "Discound",
                        style: style(),
                      ),
                      Text(
                        "Price",
                        style: style(),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "500",
                        style: style(),
                      ),
                      Text(
                        "2000",
                        style: style(),
                      ),
                      Text(
                        "1000",
                        style: style(),
                      ),
                      Text(
                        "$discount",
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "${int.parse(price!) * int.parse(quantity!)}",
                        style: style(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Totol",
                  style: style(),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  "${int.parse(price!) * int.parse(quantity!) + 500 + 2000 + 1000 - int.parse(discount!)}",
                  style: style(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  placeorderBtn(context);
                  stockUpdate();
                },
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: const Center(
                    child: Text(
                      "place order",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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

  void placeorderBtn(BuildContext context) {
    final shippingData = ShippingModel(
        customername: name,
        email: email,
        location: location,
        address: shpping,
        quantity: quantity,
        name: pname,
        price: price,
        date: year,
        time: year,
        image: image);
    addShipping(shippingData);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  NavigationPage()));
  }

  void stockUpdate() {
    final qty = int.parse(totalQuantity!) - int.parse(quantity!);
    final update = StockModel(
        name: name,
        color: color,
        catogary: catogary,
        quantity: qty.toString(),
        date: date,
        price: price,
        description: desc,
        image: image);
  }
}

TextStyle textstyl() {
  return const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}
