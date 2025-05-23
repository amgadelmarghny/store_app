import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_product_cart_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/add_to_favorite_button.dart';

class CategoryProductInteraction extends StatelessWidget {
  const CategoryProductInteraction({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryProductCartButton(
          productId: productId,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, bottom: 6),
          child: AddToFavoriteButton(productId: productId),
        ),
      ],
    );
  }
}
