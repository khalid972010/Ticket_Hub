import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticket_hub/models/category_card_model.dart';

class categoryCardComponent extends StatelessWidget {
  const categoryCardComponent({super.key, required this.categoryModel});
  final CategoryCardModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        // Customize card appearance here
        color: Colors.white,
        elevation: 4, // Add elevation for a shadow effect
        margin: const EdgeInsets.all(16), // Adjust margin as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45), // Set border radius
          side: const BorderSide(
            color: Color.fromARGB(255, 252, 252, 252), // Set border color
            width: 0, // Set border width
          ),
        ),
        child: Container(
          width: 120,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categoryModel.categoryIcon,
                color: Colors.purple,
              ),
              const SizedBox(width: 8),
              Text(categoryModel.categoryName),
            ],
          ),
        ),
      ),
    );
  }
}
