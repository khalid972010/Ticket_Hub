import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitialSignUpState());
  String? pickedImage;
  Future<String?> uploadToStorage(File imageFile) async {
    try {
      var reference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await reference.putFile(imageFile);
      pickedImage = await reference.getDownloadURL();
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
  }
}
