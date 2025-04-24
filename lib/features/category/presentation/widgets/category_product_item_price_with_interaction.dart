import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_product_interaction.dart';
import 'package:soagmb/features/category/presentation/widgets/product_price.dart';

class CategoryProductItemPriceWithInteraction extends StatelessWidget {
  const CategoryProductItemPriceWithInteraction({
    super.key,
    this.price,
    this.oldPrice,
    required this.discount,
    required this.productId,
  });
  final dynamic price, oldPrice;
  final int discount, productId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ProductPrice(
          price: price,
          discount: discount,
          oldPrice: oldPrice,
        )),
        CategoryProductInteraction(productId: productId),
      ],
    );
  }
}
