import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/photo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
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
              height: MediaQuery.of(context).size.height / 40,
            ),
            const Text(
              "Mazen Ayman",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 300,
            ),
            const Text(
              "@mazenaymann",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            const Divider(
              color: Colors.deepPurple,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: TextEditingController(text: 'Mazen Ayman'),
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  label: Text("Full Name"),
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.07,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: TextEditingController(text: 'Male'),
                      decoration: const InputDecoration(
                        hintText: 'Gender',
                        label: Text("Gender"),
                        labelStyle: TextStyle(color: Colors.grey),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.07,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: TextEditingController(text: '10-7-2000'),
                      decoration: const InputDecoration(
                        hintText: 'Date',
                        label: Text("Date"),
                        labelStyle: TextStyle(color: Colors.grey),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller:
                    TextEditingController(text: 'mazenaymanmo22@gmail.com'),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  label: Text("Email"),
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: TextEditingController(text: '01022936472'),
                decoration: const InputDecoration(
                  hintText: 'Phone number',
                  label: Text("Phone number"),
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: TextEditingController(text: '@mazenaymann'),
                decoration: const InputDecoration(
                  hintText: 'User name',
                  label: Text("User name"),
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
