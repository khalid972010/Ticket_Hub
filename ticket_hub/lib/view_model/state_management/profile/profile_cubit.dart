// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.user) : super(ProfileInitial());

  var user;
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
  ];

  void initializeAll() {
    profileData[0]['controller'].text = user['fullName'];
    profileData[1]['controller'].text = user['userName'];
    profileData[2]['controller'].text = user['email'];
    profileData[3]['controller'].text = user['phoneNumber'];
    profileData[4]['controller'].text = user['gender'];
    profileData[5]['controller'].text = user['age'].toString();
  }
}
