import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticket_hub/firebase_options.dart';
import 'package:ticket_hub/screens/on_boarding/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //! Firebase Check
  print(await fetchFirstName());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/main_background_light.png"),
              fit: BoxFit.cover,
            )),
            child: OnboardingScreen()),
      ),
    );
  }
}

//! Firebase Check
Future<String> fetchFirstName() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      // Get the first document data
      Map<String, dynamic> userData =
          querySnapshot.docs.first.data() as Map<String, dynamic>;

      // Extract the name from the user data
      String name = userData['name'] ??
          ''; // If 'name' field doesn't exist or is null, return an empty string

      return name;
    } else {
      return ''; // Returning an empty string if no users are found
    }
  } catch (e) {
    print('Error fetching first user: $e');
    return ''; // Returning an empty string in case of error
  }
}
