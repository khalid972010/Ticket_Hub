import 'dart:io';

import 'package:flutter/material.dart';

import '../../components/profile_textFormField_component.dart';
import '../../helpers/user_fun.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key});

  String userID = "77lCDGrRn0Ag8VYibouu";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: UserFun.fetchUserData(userID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          Map<String, dynamic>? userData = snapshot.data;
          TextEditingController fullNameController =
              TextEditingController(text: userData?['fullName'] ?? '');
          TextEditingController genderController =
              TextEditingController(text: userData?['gender'] ?? '');
          TextEditingController ageController =
              TextEditingController(text: userData?['age']?.toString() ?? '');
          TextEditingController emailController =
              TextEditingController(text: userData?['email'] ?? '');
          TextEditingController phoneNumberController =
              TextEditingController(text: userData?['phoneNumber'] ?? '');
          TextEditingController userNameController =
              TextEditingController(text: userData?['userName'] ?? '');
          String imgUrl = userData?['profilePicture'] ?? '';

          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      Map<String, dynamic> updatedUserData = {
                        'fullName': fullNameController.text,
                        'gender': genderController.text,
                        'age': int.tryParse(ageController.text) ?? 0,
                        'email': emailController.text,
                        'phoneNumber': phoneNumberController.text,
                        'userName': userNameController.text,
                        'profilePicture': imgUrl
                      };
                      await UserFun.updateUserData(userID, updatedUserData);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins-m',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            extendBodyBehindAppBar: true,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.width / 1000,
                            right: MediaQuery.of(context).size.height / 200,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 20,
                              width: MediaQuery.of(context).size.width / 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width / 18,
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  File? imageFile = await UserFun.pickImage(
                                    fromCamera: false,
                                    fromGallery: true,
                                  );
                                  if (imageFile != null) {
                                    String? imgUploaded =
                                        await UserFun.uploadToStorage(
                                            imageFile);
                                    print(
                                        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%:");
                                    print(imgUploaded);
                                    if (imgUploaded != null) {
                                      imgUrl = imgUploaded;
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 400,
                    ),
                    Text(
                      userData?['fullName'] ?? '',
                      style: const TextStyle(fontSize: 28),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1000,
                    ),
                    Text(
                      userData?['userName'] ?? '',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 120,
                    ),
                    const Divider(
                      color: Colors.deepPurple,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 120,
                    ),
                    CustomTextFormField(
                      controller: fullNameController,
                      height: 0.08,
                      width: 0.9,
                      hintText: 'Full name',
                      label: 'Full name',
                      paddingSymmetric: 20.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextFormField(
                            controller: genderController,
                            height: 0.08,
                            width: 0.43,
                            hintText: 'Gender',
                            label: 'Gender',
                            paddingSymmetric: 20.0,
                          ),
                          CustomTextFormField(
                            controller: ageController,
                            height: 0.08,
                            width: 0.43,
                            hintText: 'Age',
                            label: 'Age',
                            paddingSymmetric: 20.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      height: 0.08,
                      width: 0.9,
                      hintText: 'Email',
                      label: 'Email',
                      paddingSymmetric: 20.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    CustomTextFormField(
                      controller: phoneNumberController,
                      height: 0.08,
                      width: 0.9,
                      hintText: 'Phone number',
                      label: 'Phone number',
                      paddingSymmetric: 20.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    CustomTextFormField(
                      controller: userNameController,
                      height: 0.08,
                      width: 0.9,
                      hintText: 'User name',
                      label: 'User name',
                      paddingSymmetric: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('No data available'),
            ),
          );
        }
      },
    );
  }
}
