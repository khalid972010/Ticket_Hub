import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticket_hub/components/event_card_components.dart';
import 'package:ticket_hub/firebase_options.dart';
import 'package:ticket_hub/helpers/colors_helper.dart';
import 'package:ticket_hub/screens/home/home.dart';
import 'package:ticket_hub/screens/home_navigation/home_navigation.dart';
import 'package:ticket_hub/screens/loading_screen/loading.dart';

import 'components/category_card_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const EventCardComponent(),
      ),
      // Scaffold(
      //   body: Container(
      //       decoration: const BoxDecoration(
      //           image: DecorationImage(
      //         image: AssetImage("assets/images/main_background_light.png"),
      //         fit: BoxFit.cover,
      //       )),
      //       child: HomeNavigation()),
      // ),
    );
  }
}
