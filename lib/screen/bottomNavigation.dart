import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:warehouse/screen/add.dart';
import 'package:warehouse/screen/dashbord.dart';
import 'package:warehouse/screen/homepage.dart';
import 'package:warehouse/screen/profile.dart';

class NavigationPage extends StatefulWidget {
  final int initialState;

  const NavigationPage({super.key, this.initialState = 0});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late int currentState;

  final List<Widget> pages = [
    const Homepage(),
    const AddstockPage(),
    Dashbord(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    currentState = widget.initialState; // Initialize state from widget property
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentState], // Access 'pages' from within the class
      bottomNavigationBar: GNav(
        selectedIndex: currentState,
        onTabChange: (value) {
          setState(() {
            currentState = value;
          });
        },
        color: Colors.black,
        backgroundColor: const Color.fromARGB(209, 247, 246, 246),
        activeColor: Colors.black,
        gap: 8,
        tabs: const [
          GButton(
            icon: (Iconsax.home),
            text: 'home',
          ),
          GButton(
            icon: (Iconsax.add_square),
            text: 'add',
          ),
          GButton(
            icon: (Iconsax.activity),
            text: 'dashboard',
          ),
          GButton(
            icon: (Iconsax.user),
            text: 'profile',
          ),
        ],
      ),
    );
  }
}
