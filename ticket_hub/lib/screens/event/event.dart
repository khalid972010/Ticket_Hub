import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // Handle back button press
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              margin: EdgeInsets.only(
                top: 12,
                right: 12,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.bookmark_outline,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  // Handle bookmark button press
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 1140,
              child: Stack(
                children: [
                  // Image
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage(
                        "assets/images/ahly.avif",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // White area
                  Positioned(
                    bottom: 170,
                    left: 0,
                    right: 0,
                    child: IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0,
                                  3), // Offset in x and y axes from the center
                            ),
                          ],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //First part
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Al-Ahly vs Zamalek",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Egyptian premier league",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      shape: BoxShape.rectangle,
                                      color: Color.fromARGB(255, 107, 97, 201),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.sports_soccer_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //Buttons
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 24.0),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.white,
                                    ),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 107, 97, 201),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 107, 97, 201),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "I'm Interested",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 24.0),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 107, 97, 201),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Buy - 15\$",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            //Time and date
                            SizedBox(height: 30),
                            // Location
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Color(0xFFF3F0FE),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius:
                                        24, // Adjust the radius to change the size of the CircleAvatar
                                    child: Icon(
                                      Icons.access_time,
                                      color: Color.fromARGB(255, 107, 97, 201),
                                      size:
                                          24, // Adjust the size of the icon to make it smaller
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "March 24, 2021",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "8:00 - 10:00 pm",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 209, 209, 209),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 24,
                                    child: FaIcon(
                                      EvaIcons.calendarOutline,
                                      color: Color.fromARGB(255, 107, 97, 201),
                                      size: 25,
                                    ),
                                    foregroundColor:
                                        Color.fromARGB(255, 107, 97, 201),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16),
                            //Location
                            // Location
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Color(0xFFF3F0FE),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius:
                                        24, // Adjust the radius to change the size of the CircleAvatar
                                    child: Icon(Icons.location_on_outlined,
                                        color:
                                            Color.fromARGB(255, 107, 97, 201),
                                        size: 26
                                        // Adjust the size of the icon to make it smaller
                                        ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Egypt, Cairo",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "Cairo stadium",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 209, 209, 209),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 24,
                                    child: FaIcon(
                                      EvaIcons.navigation2Outline,
                                      color: Color.fromARGB(255, 107, 97, 201),
                                      size: 25,
                                    ),
                                    foregroundColor:
                                        Color.fromARGB(255, 107, 97, 201),
                                  ),
                                ),
                              ],
                            ),
                            //Place
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  "Place",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                //await launch("https://www.google.com");
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 350,
                                height: 320,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust the radius as needed
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/map.JPG"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
