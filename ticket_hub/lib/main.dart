import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticket_hub/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Add a user to Firestore
  addUser(User(name: 'John', age: 30));

  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text("Hello"),
      ),
    );
  }
}

void addUser(User user) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    await firestore.collection('users').add(user.toMap());
    print('User added successfully!');
  } catch (e) {
    print('Error adding user: $e');
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  // Convert user data to a Map for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }
}
