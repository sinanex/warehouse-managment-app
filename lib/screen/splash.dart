import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeit/screen/bottomNavigation.dart';
import 'package:storeit/screen/login.dart';
import 'package:storeit/screen/profile.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    super.initState();
    Timer(const Duration(seconds: 3), (){
      checkLog();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
                'assets/images/splashpic.png'),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "StoreIt",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dedicated ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Warehouse',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.yellow[600]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Manager ',
                  style: TextStyle(
                    color: Colors.yellow[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Text(
                  'Application',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Lottie.asset('assets/animations/loadingan.json',)
          ],
        ),
      ),
    );
  }
  
  Future<void> checkLog() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     bool? logginKey =  pref.getBool(logkey);
     if(logginKey!=null){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavigationPage()));
     }else{
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
     }

  }
}
