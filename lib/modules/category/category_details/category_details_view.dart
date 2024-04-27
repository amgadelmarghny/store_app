import 'package:flutter/material.dart';
import 'package:store_2/modules/category/category_details/category_details_body.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});
  static const id = 'categorias-details';
  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: const CategoryDetailsViewBody(),
    );
  }
}
