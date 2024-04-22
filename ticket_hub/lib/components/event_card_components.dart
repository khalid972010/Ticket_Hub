import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCardComponent extends StatelessWidget {
  const EventCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 200,
        width: 220,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 130,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/light_background.png")),
              ),
            ),
            Positioned(
              top: 15, // Adjust top position as needed
              left: 15,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(13),
                  color: Color.fromARGB(255, 3, 114, 72),
                ),
                child: IconButton(
                  icon: const Icon(Icons.data_array),
                  iconSize: 15,

                  color: const Color.fromARGB(255, 248, 247, 247),
                  onPressed: () {}, // Icon color
                ),
              ),
            ),
            Positioned(
              top: 15, // Adjust top position as needed
              right: 15,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  icon: const FaIcon(EvaIcons.bookmarkOutline),
                  iconSize: 15,

                  color: Colors.black, onPressed: () {}, // Icon color
                ),
              ),
            ),
            Positioned(
              top: 80, // Adjust top position as needed
              left: 15,

              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white),
                child: IconButton(
                  icon: const FaIcon(EvaIcons.cameraOutline),
                  iconSize: 15,
                  color: const Color.fromARGB(255, 5, 5, 5),
                  onPressed: () {}, // Icon color
                ),
              ),
            ),
            const Positioned(
                left: 30,
                bottom: 30,
                child: Text(
                  "Hello User",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                )),
            const Positioned(
                left: 30,
                bottom: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 30,
                      color: Colors.purple,
                    ),
                    Text(
                      "ssssssssss",
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
