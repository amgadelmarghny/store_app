import 'package:flutter/material.dart';
import 'package:soagmb/modules/home/widgets/category_item_list_view.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.163,
          child: CategoryItemListView(),
        ),
      ],
    );
  }
}
