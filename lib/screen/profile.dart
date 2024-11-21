import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/databases/model/userdata.dart';
import 'package:storeit/screen/bottomNavigation.dart';
import 'package:storeit/screen/history.dart';
import 'package:storeit/screen/login.dart';
import 'package:storeit/screen/useredit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "profile",
          style: style(),
        ),
      ),
      body: ValueListenableBuilder(
        builder: (context, Box<UserData> box, child) {
          final data = box.get('profile');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                  backgroundImage: data!.image != null
                      ? FileImage(File(data.image!)) as ImageProvider
                      : const AssetImage("assets/images/profile.png"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Personal Details",
                  style: style(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: style(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data.email,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUserPage(
                                      image: data.image,
                                      name: data.name,
                                      email: data.email,
                                      password: data.password)));
                        },
                        title: const Text("Edit profile"),
                        trailing: const Icon(Iconsax.arrow_right),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShippingHistory()));
                        },
                        title: const Text("Oders history"),
                        trailing: const Icon(Iconsax.arrow_right),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          clearDataBtn(context);
                        },
                        title: const Text("clear all data"),
                        trailing: const Icon(Iconsax.arrow_right),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          signOutBtn(context);
                        },
                        title: const Text("logout "),
                        trailing: const Icon(Iconsax.logout_1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        valueListenable: box.listenable(),
      ),
    );
  }

  void signOutBtn(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: SizedBox(
              height: 120,
              child: Column(
                children: [
                  Text(
                    "conform sign out",
                    style: style(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "cancel",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              logOut(context);
                            },
                            child: const Text(
                              "sign out",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(logkey, false);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void clearDataBtn(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      Text(
                        "conform clear data",
                        style: style(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "cancel",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  clearDAta();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigationPage()));
                                },
                                child: const Text(
                                  "clear data",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  )));
        });
  }

  clearDAta() async {
    await clearData();
    await shippingDataClear();
  }
}

TextStyle style() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

const logkey = 'loggkey';
