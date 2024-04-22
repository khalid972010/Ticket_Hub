import 'package:flutter/material.dart';
import 'package:ticket_hub/components/category_card_components.dart';
import 'package:ticket_hub/models/category_card_model.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({super.key});
  final List<CategoryCardModel> categoryList = const [
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.camera,
    ),
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.camera,
    ),
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.camera,
    ),
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.camera,
    ),
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.camera,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return categoryCardComponent(
            categoryModel: categoryList[index],
          );
        },
      ),
    );
  }
}
