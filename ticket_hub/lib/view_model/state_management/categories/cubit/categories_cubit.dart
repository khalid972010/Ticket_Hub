import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ticket_hub/models/category_card_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final List<CategoryCardModel> categoryList = const [
    CategoryCardModel(
      categoryName: "Sports",
      categoryIcon: Icons.sports_soccer_outlined,
    ),
    CategoryCardModel(
      categoryName: "Music",
      categoryIcon: Icons.music_note_outlined,
    ),
    CategoryCardModel(
      categoryName: "Nightlife",
      categoryIcon: Icons.nightlife_outlined,
    ),
    CategoryCardModel(
      categoryName: "Holiday",
      categoryIcon: Icons.beach_access_outlined,
    ),
  ];

  int? selectedIndex;

  selectCategory(int index) {
    if (index == selectedIndex) {
      selectedIndex = null;
    } else {
      selectedIndex = index;
    }
    emit(CategoriesChangePage());
  }
}
