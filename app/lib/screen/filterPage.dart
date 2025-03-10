import 'dart:io';

import 'package:flutter/material.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/screen/profile.dart';
import 'package:storeit/screen/stockinfo.dart';

// ignore: must_be_immutable
class FilterPage extends StatelessWidget {
  String? catogary;
  FilterPage({
    super.key,
    required this.catogary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          catogary!,
          style: style(),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: stockmodelnotifer,
        builder: (context, value, child) {
          final products =
              value.where((product) => product.catogary == catogary).toList();
          if (products.isEmpty) {
            return Center(
              child: Text("no items in $catogary",style: style(),),
            );
          } else {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final data = products[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StockDetails(
                              index: index,
                                name: data.name,
                                color: data.color,
                                catogary: catogary,
                                quantity: data.quantity,
                                date: data.date,
                                price: data.price,
                                decs: data.description,
                                image: data.image)));
                  },
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Image.file(File(data.image!)),
                  ),
                  subtitle: Text(data.quantity!),
                  title: Text(
                    data.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
