import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_hub/helpers/colors_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Stack(
              children: [
                Image(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: const AssetImage("assets/images/light_background.png"),
                ),
                const Positioned(
                  top: 120, // Adjust as needed
                  left: 16, // Adjust as needed
                  child: Text(
                    'Welcome back,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins-T",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 150, // Adjust as needed
                  left: 16, // Adjust as needed
                  child: Text(
                    'Jonathan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(13.0),
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.0),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search events...',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: ColorsHelpers.createMaterialColor(
                                    const Color.fromARGB(255, 107, 96, 209)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const FaIcon(
                                size: 30,
                                EvaIcons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
