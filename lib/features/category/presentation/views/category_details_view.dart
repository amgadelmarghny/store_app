import 'package:flutter/material.dart';
import 'package:soagmb/features/category/presentation/widgets/category_details_body.dart';

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
      body: CategoryDetailsViewBody(categoryName: categoryName),
    );
  }
}
