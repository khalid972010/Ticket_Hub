import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_hub/firebase_options.dart';
import 'package:ticket_hub/helpers/colors_helper.dart';
import 'package:ticket_hub/screens/event/event.dart';
import 'package:ticket_hub/screens/home_navigation/home_navigation.dart';
import 'package:ticket_hub/screens/loading_screen/loading.dart';
import 'package:ticket_hub/screens/on_boarding/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeHomePage();
}

void initializeHomePage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  // Add logic for whether user should go to home (Logged in) or Sign in

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins-M',
        primarySwatch: ColorsHelpers.createMaterialColor(
          const Color.fromARGB(255, 107, 96, 209),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: HomeNavigation(),
      ),
    );
  }
}
