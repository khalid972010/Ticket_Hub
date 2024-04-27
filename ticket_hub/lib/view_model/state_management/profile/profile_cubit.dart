// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userId) : super(ProfileInitial());

  String userId;
  Map<String, dynamic>? user;

  List profileData = [
    {
      'label': 'fullName',
      'controller': TextEditingController(),
    },
    {
      'label': 'userName',
      'controller': TextEditingController(),
    },
    {
      'label': 'email',
      'controller': TextEditingController(),
    },
    {
      'label': 'phoneNumber',
      'controller': TextEditingController(),
    },
    {
      'label': 'age',
      'controller': TextEditingController(),
    },
    {
      'label': 'gender',
      'controller': TextEditingController(),
    },
    {
      'label': 'profilePicture',
      'controller': "",
    }
  ];

  Future fetchUserData() async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (document.exists) {
        // Get the document data
        user = document.data() as Map<String, dynamic>;

        // Add the document ID to the userData map
        user!['id'] = document.id;

        initializeAll();
        emit(ProfileFetched());
      } else {
        print("Document does not exist");
        return null; // Returning null if no document with the provided ID is found
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null; // Returning null in case of an error
    }
  }

  void initializeAll() {
    profileData[0]['controller'] = TextEditingController(text: user!['name']);
    profileData[1]['controller'] =
        TextEditingController(text: user!['userName']);
    profileData[2]['controller'] = TextEditingController(text: user!['email']);
    profileData[3]['controller'] =
        TextEditingController(text: user!['phoneNumber']);
    profileData[4]['controller'] = TextEditingController(text: user!['gender']);
    profileData[5]['controller'] =
        TextEditingController(text: user!['age'].toString());
    profileData[6]['controller'] = user!['profilePicture'].toString();
  }

  Future<void> updateUserData(
      String userId, Map<String, dynamic> userData) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update(userData);
      emit(UpdateSuccess('Congrats!! Profile Updated'));
    } catch (e) {
      emit(UpdateFailed('Profile Update Failed'));
    }
  }

  Future<String?> uploadToStorage(File imageFile) async {
    try {
      var reference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await reference.putFile(imageFile);
      profileData[6]['controller'] = await reference.getDownloadURL();
      emit(ImageChanged());
      return await reference.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<File?> pickImage({
    fromGallery = false,
    fromCamera = false,
  }) async {
    try {
      var imageXFile = await ImagePicker().pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      );
      if (imageXFile == null) return null;
      var imageFile = File(imageXFile.path);

      return imageFile;
    } on Exception catch (exception) {
      print('Failed to pick image: $exception');
    }
    return null;
  }
}
