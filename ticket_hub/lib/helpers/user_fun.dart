import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UserFun {
  static Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (document.exists) {
        // Get the document data
        Map<String, dynamic> userData = document.data() as Map<String, dynamic>;

        // Add the document ID to the userData map
        userData['id'] = document.id;

        return userData;
      } else {
        print("Document does not exist");
        return null; // Returning null if no document with the provided ID is found
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null; // Returning null in case of an error
    }
  }

  static Future<void> updateUserData(
      String userId, Map<String, dynamic> userData) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update(userData);
      print('User data updated successfully!');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  static Future<String?> uploadToStorage(File imageFile) async {
    try {
      var reference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await reference.putFile(imageFile);
      return await reference.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  static Future<File?> pickImage({
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
  }
}
