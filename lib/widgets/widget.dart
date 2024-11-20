import 'package:flutter/material.dart';
import 'package:storeit/screen/profile.dart';

Widget imageContainer({
  required String name,
  required String imagePath,
  required void Function() callback,
}) {
  return GestureDetector(
    onTap: callback,
    child: SizedBox(
      width: 170,
      height: 170,
      child: Column(
        children: [
          SizedBox(
            width: 140,
            child: Image.asset(imagePath),
          ),
          Text(
            name,
            style: style(),
          ),
        ],
      ),
    ),
  );
}

Widget contextfeild(
    {required String hindtext, TextEditingController? controllertext}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      controller: controllertext,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        label: Text(hindtext),
      ),
    ),
  );
}

Widget itemContainer() {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: 80,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: Image.asset(
              'assets/images/MQTR3.jpeg',
              width: 50,
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Beat Studio pro",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Nov 8th 2024",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Completed",
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget cont() {
  return GestureDetector(
    child: Container(
      width: double.infinity,
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            child: Image.asset('assets/images/MQTR3.jpeg'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Beat Studio Pro",
                style: style(),
              ),
              Text(
                "Qty : 1000",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    ),
  );
}
