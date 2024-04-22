import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_hub/models/event_card_model.dart';

class EventCardComponent extends StatelessWidget {
  const EventCardComponent({super.key, required this.eventCard});
  final EventCardModel eventCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(25),
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
                      fit: BoxFit.fill, image: AssetImage(eventCard.image)),
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
                    color: const Color.fromARGB(255, 3, 114, 72),
                  ),
                  child: IconButton(
                    icon: Icon(eventCard.icon1),
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
                    icon: FaIcon(eventCard.icon2),
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
                    icon: FaIcon(eventCard.iconDate),
                    iconSize: 22,
                    color: const Color.fromARGB(255, 5, 5, 5),
                    onPressed: () {}, // Icon color
                  ),
                ),
              ),
              Positioned(
                  left: 15,
                  bottom: 40,
                  child: Text(
                    eventCard.text,
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
                      Text(
                        eventCard.location,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
