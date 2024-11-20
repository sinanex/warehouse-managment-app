import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:storeit/databases/model/model.dart';
import 'package:storeit/databases/model/shipping.dart';
import 'package:storeit/databases/model/userdata.dart';
import 'package:storeit/screen/splash.dart';


Future<void> main() async
{
   WidgetsFlutterBinding.ensureInitialized();
  await  Hive.initFlutter();
  Hive.registerAdapter(StockModelAdapter());
  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(ShippingModelAdapter());
await Hive.openBox<UserData>('profileBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  textTheme: GoogleFonts.nunitoTextTheme(),
),
      home: const SplashScreen(),
    );
  }
}