import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_hub/components/category_card_components.dart';
import 'package:ticket_hub/models/category_card_model.dart';
import 'package:ticket_hub/view_model/state_management/categories/categories_cubit.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: SizedBox(
        height: 100,
        child: Container(
          margin: EdgeInsets.only(right: 15, left: 5),
          child: BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
              final categoriesData = categoriesCubit.categoryList;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return categoryCardComponent(
                    categoryModel: categoriesData[index],
                    index: index,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
