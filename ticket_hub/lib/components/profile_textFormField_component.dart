import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.width,
    required this.height,
    required this.paddingSymmetric,
    required this.initialValue,
    required this.hintText,
    required this.label,
  }) : super(key: key);

  final double width;
  final double height;
  final double paddingSymmetric;
  final String initialValue;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      padding: EdgeInsets.symmetric(horizontal: paddingSymmetric),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
