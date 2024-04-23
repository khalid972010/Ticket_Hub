import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ticket_hub/models/category_card_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final List<CategoryCardModel> categoryList = [
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.sports_soccer_outlined,
      isSelected: false,
    ),
    CategoryCardModel(
      categoryName: "Music",
      categoryIcon: Icons.music_note_outlined,
      isSelected: false,
    ),
    CategoryCardModel(
      categoryName: "Nightlife",
      categoryIcon: Icons.nightlife_outlined,
      isSelected: false,
    ),
    CategoryCardModel(
      categoryName: "Holiday",
      categoryIcon: Icons.beach_access_outlined,
      isSelected: false,
    ),
  ];

  int? selectedIndex;

  selectCategory(int index) {
    if (index == selectedIndex) {
      selectedIndex = null;
    } else {
      selectedIndex = index;
      categoryList[index].isSelected = true;
    }
    emit(CategoriesChangePage());
  }
}
