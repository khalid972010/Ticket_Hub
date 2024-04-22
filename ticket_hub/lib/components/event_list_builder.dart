import 'package:flutter/material.dart';
import 'package:ticket_hub/components/event_card_components.dart';

import '../models/event_card_model.dart';

class EventListBuilder extends StatelessWidget {
  const EventListBuilder({super.key});
  final List<EventCardModel> eventList = const [
    EventCardModel(
        image: "assets/images/light_background.png",
        text: "Hi this is sport section",
        location: "Egypt/cairo/smart village",
        icon1: Icons.camera_front_outlined,
        icon2: Icons.mark_chat_read_outlined,
        iconDate: Icons.cached_outlined),
    EventCardModel(
        image: "assets/images/light_background.png",
        text: "Hi this is sport section",
        location: "Egypt/cairo/smart village",
        icon1: Icons.camera_front_outlined,
        icon2: Icons.mark_chat_read_outlined,
        iconDate: Icons.cached_outlined),
    EventCardModel(
        image: "assets/images/light_background.png",
        text: "Hi this is sport section",
        location: "Egypt/cairo/smart village",
        icon1: Icons.camera_front_outlined,
        icon2: Icons.mark_chat_read_outlined,
        iconDate: Icons.cached_outlined),
    EventCardModel(
        image: "assets/images/light_background.png",
        text: "Hi this is sport section",
        location: "Egypt/cairo/smart village",
        icon1: Icons.camera_front_outlined,
        icon2: Icons.mark_chat_read_outlined,
        iconDate: Icons.cached_outlined),
    EventCardModel(
        image: "assets/images/light_background.png",
        text: "Hi this is sport section",
        location: "Egypt/cairo/smart village",
        icon1: Icons.camera_front_outlined,
        icon2: Icons.mark_chat_read_outlined,
        iconDate: Icons.cached_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
          itemCount: eventList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return EventCardComponent(
              eventCard: eventList[index],
            );
          }),
    );
  }
}
