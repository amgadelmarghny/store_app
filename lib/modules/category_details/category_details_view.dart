import 'package:flutter/material.dart';
import 'package:store_2/modules/category_details/category_details_body.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});
  static const id = 'categorias-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sfdvfdbn'),
      ),
      body: const CategoryDetailsViewBody(),
    );
  }
}

