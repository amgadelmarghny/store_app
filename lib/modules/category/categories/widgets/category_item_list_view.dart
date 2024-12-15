import 'package:flutter/material.dart';
import 'package:soagmb/modules/category/categories/category_item_large.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({
    super.key,
    required this.categoriesList,
  });

  final List categoriesList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CategoryItem(categoryModel: categoriesList[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: categoriesList.length,
    );
  }
}