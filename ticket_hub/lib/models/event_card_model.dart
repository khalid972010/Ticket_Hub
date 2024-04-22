import 'package:flutter/material.dart';

class EventCardModel {
  final String image;
  final String text;
  final String location;
  final IconData icon1;
  final IconData icon2;
  final IconData iconDate;

  const EventCardModel(
      {required this.image,
      required this.text,
      required this.location,
      required this.icon1,
      required this.icon2,
      required this.iconDate});
}
