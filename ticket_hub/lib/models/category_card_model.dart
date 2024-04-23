import 'package:flutter/material.dart';

class CategoryCardModel {
  final String categoryName;
  final IconData categoryIcon;
  bool isSelected;

  CategoryCardModel({
    required this.categoryName,
    required this.categoryIcon,
    required this.isSelected,
  });
}
