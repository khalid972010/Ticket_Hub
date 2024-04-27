import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ticket_hub/view_model/state_management/auth/sign_up/sign_up_cubit.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = 'SignUpRoute';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = false;
  TextEditingController nameValue = TextEditingController();
  TextEditingController emailValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();
  TextEditingController phoneNumberValue = TextEditingController();

  final ImagePicker picker = ImagePicker();
  File? pickedImage;
  String ImageUrl =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final signUpCubit = BlocProvider.of<SignUpCubit>(context);

          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    children: [
                      const Image(
                          image:
                              AssetImage('assets/images/light_background.png'),
                          opacity: AlwaysStoppedAnimation(.7)),
                      Column(
                        children: [
                          SizedBox(
                            height: deviceHeight / 12,
                          ),
                          const Text(
                            "Let's Get Started!",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          Text("Create your account",
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(
                            height: deviceHeight / 15,
                          ),
                          Expanded(
                            child: Column(children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  CircleAvatar(
                                      radius: 85,
                                      backgroundImage: signUpCubit
                                                  .pickedImage ==
                                              null
                                          ? const NetworkImage(
                                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')
                                          : NetworkImage(
                                              signUpCubit.pickedImage!)),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.black.withOpacity(0.9),
                                      child: IconButton(
                                        onPressed: () async {
                                          final imageFile =
                                              await signUpCubit.pickImage(
                                            fromCamera: false,
                                            fromGallery: true,
                                          );
                                          if (imageFile != null) {
                                            final imgUploaded =
                                                await signUpCubit
                                                    .uploadToStorage(imageFile);
                                            if (imgUploaded != null) {
                                              signUpCubit.pickedImage =
                                                  imgUploaded;
                                            }
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: SizedBox(
                                  height: deviceHeight / 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextFormField(
                                        controller: nameValue,
                                        onChanged: (value) {},
                                        keyboardType: TextInputType.name,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                          border: InputBorder.none,
                                          labelText: 'Name',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: SizedBox(
                                  height: deviceHeight / 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextFormField(
                                        controller: emailValue,
                                        onChanged: (value) => {},
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                          border: InputBorder.none,
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: SizedBox(
                                  height: deviceHeight / 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: passwordValue,
                                              onChanged: (value) => {},
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                border: InputBorder.none,
                                                labelText: 'Password',
                                                labelStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                              obscureText: !isPasswordVisible,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isPasswordVisible =
                                                      !isPasswordVisible;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.visibility,
                                                size: 18,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: SizedBox(
                                  height: deviceHeight / 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextField(
                                        controller: phoneNumberValue,
                                        onChanged: (value) {},
                                        keyboardType: TextInputType.phone,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                          border: InputBorder.none,
                                          labelText: 'Phone Number',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight / 18,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  minimumSize: MaterialStateProperty.all(Size(
                                      deviceWidth / 1.2, deviceHeight / 20)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepPurple),
                                ),
                                onPressed: () async {
                                  registerUser(
                                      context,
                                      emailValue.text,
                                      passwordValue.text,
                                      nameValue.text,
                                      phoneNumberValue.text);
                                },
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 21),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already a user? ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Click here to login",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.deepPurple[900],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<void> registerUser(BuildContext context, String email, String password,
    String name, String phoneNumber) async {
  try {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Check if the phone number is already in use
    QuerySnapshot phoneQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    if (phoneQuery.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The phone number is already in use.'),
        ),
      );
      return;
    }
    // Save additional user information to Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User registered successfully")),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The account already exists for that email.'),
        ),
      );
    } else if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Weak Password'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create user: $e'),
        ),
      );
    }
  }
}
