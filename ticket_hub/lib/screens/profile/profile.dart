import 'package:flutter/material.dart';
import '../../components/profile_textFormField_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: 'Poppins-m',
                  fontWeight: FontWeight.w600,
                ),
              ))
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/photo.jpg'),
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
                          iconSize: MediaQuery.of(context).size.width / 18,
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Add your edit functionality here
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
              const Text(
                "Mazen Ayman",
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1000,
              ),
              const Text(
                "@mazenaymann",
                style: TextStyle(
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
              const CustomTextFormField(
                height: 0.08,
                width: 0.9,
                hintText: 'Full name',
                label: 'Full name',
                initialValue: 'Mazen Ayman',
                paddingSymmetric: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFormField(
                      height: 0.08,
                      width: 0.43,
                      hintText: 'Gender',
                      label: 'Gender',
                      initialValue: 'Male',
                      paddingSymmetric: 20.0,
                    ),
                    CustomTextFormField(
                      height: 0.08,
                      width: 0.43,
                      hintText: 'Date',
                      label: 'Date',
                      initialValue: '10-7-2000',
                      paddingSymmetric: 20.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const CustomTextFormField(
                height: 0.08,
                width: 0.9,
                hintText: 'Email',
                label: 'Email',
                initialValue: 'mazenaymanmo22@gmail.com',
                paddingSymmetric: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const CustomTextFormField(
                height: 0.08,
                width: 0.9,
                hintText: 'Phone number',
                label: 'Phone number',
                initialValue: '01022936472',
                paddingSymmetric: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const CustomTextFormField(
                height: 0.08,
                width: 0.9,
                hintText: 'User name',
                label: 'User name',
                initialValue: '@mazenaymann',
                paddingSymmetric: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
