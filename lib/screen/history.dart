import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse/databases/functions/function.dart';
import 'package:warehouse/screen/historydetials.dart';
import 'package:warehouse/screen/profile.dart';

class ShippingHistory extends StatelessWidget {
  const ShippingHistory({super.key});

  @override
Widget build(BuildContext context) {
  getShippingData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Transaction",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),),),
      body: ValueListenableBuilder(valueListenable: shippingmodelNotifeir, builder: (context, value, child) {
        return
        value.isEmpty?   Center(child: Text("No Transitions",style: style(),),):
         ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
          final data = value[index];
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Historydetials(name: data.customername, pname: data.name, catogary: data.name, date: data.date, price: data.price, quantity: data.quantity, address: data.address, image: data.image)));
            },
            title: Text(data.name!,style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Text(data.date!),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
     child: data.image != null 
    ? Image.file(
        File(data.image!), 
      )
    : Image.asset(
        'assets/images/image-3.png',
      ),
              // child: Image.file(File(data.image!)),
            ),
            trailing: Text("Completed",style: TextStyle(
              color: Colors.green[600],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          );
        },);
      },)
    );
  }
}
