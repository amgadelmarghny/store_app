import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_in_home_item_list_view.dart';
import 'package:soagmb/generated/l10n.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          S.of(context).categories,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.163,
          child: CategoryHomeItemListView(),
        ),
      ],
    );
  }
}
