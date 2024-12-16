import 'package:flutter/material.dart';
import 'package:soagmb/modules/category/categories/category_item_large.dart';

class CategoryLargeItemListView extends StatelessWidget {
  const CategoryLargeItemListView({
    super.key,
    required this.categoriesList,
  });

  final List categoriesList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CategoryItemLarge(categoryModel: categoriesList[index]);
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
