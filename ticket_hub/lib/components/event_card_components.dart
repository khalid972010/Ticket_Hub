import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_hub/helpers/category_to_icon.dart';
import 'package:ticket_hub/models/event_card_model.dart';
import 'package:ticket_hub/screens/event/event.dart';

class EventCardComponent extends StatelessWidget {
  const EventCardComponent({super.key, required this.eventCard});
  final Map<String, dynamic>? eventCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(25),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return EventScreen(eventId: '1pe3HzcVlXxuG27a00nN');
              },
            ));
          },
          child: Container(
            height: 200,
            width: 220,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(eventCard?["image"])),
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
                      color: Color.fromARGB(255, 107, 97, 201),
                    ),
                    child: IconButton(
                      //TODO: Icon
                      icon: Icon(
                          IconsHelpers.getCategoryIcon(eventCard!["category"])),
                      iconSize: 25,

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
                      //TODO Icon
                      icon: Icon(Icons.bookmark_border),
                      iconSize: 15,

                      color: Colors.black, onPressed: () {}, // Icon color
                    ),
                  ),
                ),
                Positioned(
                  top: 80, // Adjust top position as needed
                  left: 15,

                  child: Container(
                    width: 47,
                    height: 47,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          eventCard!["date"].toString().split('/').first,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          eventCard!["date"].toString().split('/')[1],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 15,
                    bottom: 40,
                    child: Text(
                      eventCard?["title"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w900),
                      overflow: TextOverflow.clip,
                    )),
                Positioned(
                    left: 7,
                    bottom: 7,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 30,
                          color: Colors.purple,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            eventCard?["location"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
