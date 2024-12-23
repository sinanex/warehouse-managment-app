import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/screen/edit.dart';
import 'package:storeit/screen/ship.dart';

String? formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

// ignore: must_be_immutable
class StockDetails extends StatefulWidget {
  String? name;
  String? catogary;
  String? color;
  String? quantity;
  String? price;
  String? date;
  String? decs;
  dynamic image;
  int index;

  StockDetails({
    super.key,
    required this.name,
    required this.color,
    required this.catogary,
    required this.quantity,
    required this.date,
    required this.price,
    required this.decs,
    required this.image,
    required this.index,
  });

  @override
  State<StockDetails> createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'stock details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
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
                    child: Image.file(File(widget.image!)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${widget.name}",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Catogary : ${widget.catogary}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Color : ${widget.color}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              Text('${widget.decs}'),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Quantity : ${widget.quantity}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price : ₹${widget.price}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "date : ${widget.date}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Shppingpage(
                                      pname: widget.name,
                                      image: widget.image,
                                      price: widget.price,
                                      catogary: widget.catogary,
                                      color: widget.color,
                                      date: widget.date,
                                      decs: widget.decs,
                                      index: widget.index,
                                      itemquantity: widget.quantity,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "shipping",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPage(
                                    name: widget.name,
                                    color: widget.color,
                                    catogary: widget.catogary,
                                    date: widget.date,
                                    price: widget.price,
                                    decs: widget.decs,
                                    quantity: widget.quantity,
                                    index: widget.index,
                                    image: widget.image)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "edit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        deleteData(widget.index);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "delete",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
