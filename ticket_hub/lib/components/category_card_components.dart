import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_hub/models/category_card_model.dart';
import 'package:ticket_hub/view_model/state_management/categories/cubit/categories_cubit.dart';

class categoryCardComponent extends StatelessWidget {
  categoryCardComponent({
    super.key,
    required this.categoryModel,
    required this.index,
  });
  final CategoryCardModel categoryModel;
  final int index;
  bool isCardSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
          if (index == categoriesCubit.selectedIndex) {
            isCardSelected = true;
          } else {
            isCardSelected = false;
          }
          return GestureDetector(
            onTap: () {
              categoriesCubit.selectCategory(index);
              isCardSelected = !isCardSelected;
            },
            child: Card(
              // Customize card appearance here
              color: isCardSelected
                  ? Color.fromARGB(255, 107, 97, 201)
                  : Colors.white,
              elevation: 2, // Add elevation for a shadow effect
              margin: const EdgeInsets.only(
                left: 15,
                top: 25,
                bottom: 25,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Set border radius
                side: const BorderSide(
                  color: Color.fromARGB(255, 252, 252, 252), // Set border color
                  width: 0, // Set border width
                ),
              ),
              child: Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categoryModel.categoryIcon,
                      color: !isCardSelected
                          ? Color.fromARGB(255, 107, 97, 201)
                          : Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      categoryModel.categoryName,
                      style: TextStyle(
                        color: !isCardSelected
                            ? Color.fromARGB(255, 107, 97, 201)
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
