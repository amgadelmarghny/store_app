import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_item_grid_view.dart';
import 'package:soagmb/generated/l10n.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).products),
        const SizedBox(
          height: 7,
        ),
        ProductItemGridView(),
      ],
    );
  }
}
