import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_hub/view_model/state_management/profile/profile_cubit.dart';

import '../../components/profile_textFormField_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit("77lCDGrRn0Ag8VYibouu")..fetchUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final profileCubit = BlocProvider.of<ProfileCubit>(context);
          final profileData = profileCubit.profileData;
          if (state is ProfileInitial) {
            return const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
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
                      final updatedUserData = {
                        'fullName': profileData[0]['controller'].text,
                        'gender': profileData[4]['controller'].text,
                        'age': profileData[5]['controller'].text,
                        'email': profileData[2]['controller'].text,
                        'phoneNumber': profileData[3]['controller'].text,
                        'userName': profileData[1]['controller'].text,
                        'profilePicture': profileData[6]['controller'],
                      };
                      profileCubit.updateUserData(
                          "77lCDGrRn0Ag8VYibouu", updatedUserData);
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
                                image:
                                    NetworkImage(profileData[6]['controller']),
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
                                  final imageFile =
                                      await profileCubit.pickImage(
                                    fromCamera: false,
                                    fromGallery: true,
                                  );
                                  if (imageFile != null) {
                                    final imgUploaded = await profileCubit
                                        .uploadToStorage(imageFile);
                                    if (imgUploaded != null) {
                                      profileData[6]['controller'] =
                                          imgUploaded;
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 400),
                    Text(
                      profileData[0]['controller'].text,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 1000),
                    Text(
                      profileData[1]['controller'].text,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    const Divider(
                      color: Colors.deepPurple,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    CustomTextFormField(
                      controller: profileData[0]['controller'],
                      height: 0.08,
                      width: 0.9,
                      hintText: 'Full name',
                      label: 'Full name',
                      paddingSymmetric: 20.0,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextFormField(
                            controller: profileData[4]['controller'],
                            height: 0.08,
                            width: 0.43,
                            hintText: 'Gender',
                            label: 'Gender',
                            paddingSymmetric: 20.0,
                          ),
                          CustomTextFormField(
                            controller: profileData[5]['controller'],
                            height: 0.08,
                            width: 0.43,
                            hintText: 'Age',
                            label: 'Age',
                            paddingSymmetric: 20.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    CustomTextFormField(
                      controller: profileData[2]['controller'],
                      height: 0.08,
                      width: 0.9,
                      hintText: 'Email',
                      label: 'Email',
                      paddingSymmetric: 20.0,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    CustomTextFormField(
                      controller: profileData[3]['controller'],
                      height: 0.08,
                      width: 0.9,
                      hintText: 'Phone number',
                      label: 'Phone number',
                      paddingSymmetric: 20.0,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    CustomTextFormField(
                      controller: profileData[1]['controller'],
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
        },
      ),
    );
  }
}
