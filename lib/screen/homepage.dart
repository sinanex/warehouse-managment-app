import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/databases/model/userdata.dart';
import 'package:storeit/screen/dashbord.dart';
import 'package:storeit/screen/filterPage.dart';
import 'package:storeit/screen/history.dart';
import 'package:storeit/screen/liststock.dart';
import 'package:storeit/screen/profile.dart';
import 'package:storeit/widgets/widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  int a=0;
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<UserData>('profileBox');
    final profile = box.get('profile');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: ValueListenableBuilder(
        valueListenable: stockmodelnotifer,
        builder: (context, value, child) {
          a=value.length;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: profile!.image != null
                        ? FileImage(File(profile.image!)) as ImageProvider
                        : const AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Hey, ${profile.name}",
                    style: style(),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShippingHistory()));
                    },
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Orders",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                "Checking",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Image.asset(
                                  'assets/images/container.png',
                                  width: 88,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashbord()));
                    },
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Dash",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                "Board",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Image.asset(
                                  'assets/images/dashboard.png',
                                  width: 88,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 50),
                child: Text(
                  "recent activities",
                  style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900,
                      fontSize: 19),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300]!,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer)
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/checklist.png',
                            width: 55,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TOTAL STOCK",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "${a} Packages",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 50),
                child: Text(
                  "catogary",
                  style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900,
                      fontSize: 19),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  imageContainer(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterPage(catogary: "Laptop")));
                      },
                      imagePath: 'assets/images/lap.png',
                      name: 'Laptops'),
                  imageContainer(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterPage(catogary: "Mobile")));
                      },
                      imagePath: 'assets/images/mobil.png',
                      name: 'Mobiles'),
                  //
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  imageContainer(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterPage(catogary: "Headphone")));
                      },
                      name: 'HeadPhones',
                      imagePath: 'assets/images/head.png'),
                  imageContainer(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterPage(catogary: "Speakers")));
                      },
                      name: 'Speakers',
                      imagePath: 'assets/images/speakerr.png')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  imageContainer(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterPage(catogary: "Television")));
                      },
                      name: 'Televisions',
                      imagePath: 'assets/images/tvv.png'),
                  imageContainer(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterPage(catogary: "Smart Watches")));
                      },
                      name: 'Smart Watches',
                      imagePath: 'assets/images/sw.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      )),
    );
  }
}
