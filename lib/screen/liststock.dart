import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/databases/model/model.dart';
import 'package:storeit/screen/stockinfo.dart';
int stockLength =0;
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String search = '';
  List<StockModel> searchList = [];

  void searchUpdate() {
    searchList = stockmodelnotifer.value
        .where((stockData) => stockData.name != null &&
            stockData.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
var a='';
  @override
  void initState(){
    super.initState();
    getData().then((_){
     getData();
     searchUpdate();
    });
  }
  Widget build(BuildContext context) {
    getData(); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        flexibleSpace: Column(
          children: [
            const SizedBox(height: 65),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 224, 224),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        search = value;
                        searchUpdate();
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<List<StockModel>>(
        valueListenable: stockmodelnotifer,
        builder: (context, stockList, child) {
          final displayList =
              search.isNotEmpty ? searchList : stockList;

          if (displayList.isEmpty) {
            return Center(
             child: Lottie.asset('assets/animations/noitem.json',repeat: false,width: 250),
            );
          }

          return ListView.builder(
            itemCount: displayList.length,
            itemBuilder: (context, index) {
              final data = displayList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: data.image != null
                      ? FileImage(File(data.image!)) as ImageProvider
                      : const AssetImage("assets/images/checklist.png"),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StockDetails(
                        index: index,
                        name: data.name,
                        color: data.color,
                        catogary: data.catogary,
                        quantity: data.quantity,
                        date: data.date,
                        price: data.price,
                        decs: data.description,
                        image: data.image,
                      ),
                    ),
                  );
                },
                title: Text(data.name ?? 'Unknown'),
                subtitle: Text(data.quantity ?? 'N/A'),
              );
            },
          );
        },
      ),
    );
  }
}