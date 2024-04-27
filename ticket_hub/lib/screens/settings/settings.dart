import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_hub/screens/profile/profile.dart';
import 'package:ticket_hub/view_model/state_management/profile/profile_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit("${FirebaseAuth.instance.currentUser?.uid}")
            ..fetchUserData(),
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: SingleChildScrollView(
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final profileCubit = BlocProvider.of<ProfileCubit>(context);
                final profileData = profileCubit.profileData;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                NetworkImage(profileData[6]['controller'])),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          profileData[0]['controller'].text,
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ProfileScreen(
                                  userID:
                                      "${FirebaseAuth.instance.currentUser?.uid}",
                                );
                              },
                            )).then((value) {
                              if (value == 'refresh') {
                                profileCubit.fetchUserData();
                              }
                            });
                          },
                          padding: EdgeInsetsDirectional.zero,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            leading: const Icon(
                              Icons.person_outline,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            title: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              size: 40,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsetsDirectional.zero,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            leading: const Icon(
                              Icons.mail_outline,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            title: Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            trailing: Icon(Icons.chevron_right,
                                size: 40, color: Colors.black.withOpacity(0.9)),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsetsDirectional.zero,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            leading: const Icon(
                              Icons.dark_mode_outlined,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            title: Text(
                              "Dark Mode",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              size: 40,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsetsDirectional.zero,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            leading: const Icon(
                              Icons.lock_outlined,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            title: Text(
                              "Change Password",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              size: 40,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsetsDirectional.zero,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            leading: const Icon(
                              Icons.privacy_tip_outlined,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            title: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              size: 40,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsetsDirectional.zero,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            leading: const Icon(
                              Icons.logout_outlined,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            title: Text(
                              "Log Out",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              size: 40,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
