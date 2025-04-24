import 'package:flutter/material.dart';
import 'package:soagmb/features/category/presentation/widgets/category_product_item_price_with_interaction.dart';

class CategoryProductItemInfoWithInteraction extends StatelessWidget {
  const CategoryProductItemInfoWithInteraction(
      {super.key,
      this.price,
      this.oldPrice,
      required this.discount,
      required this.productId,
      required this.name});
  final dynamic price, oldPrice;
  final int discount, productId;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
        ),
        const SizedBox(
          height: 5,
        ),
        CategoryProductItemPriceWithInteraction(
          discount: discount,
          productId: productId,
          price: price,
          oldPrice: oldPrice,
        )
      ],
    );
  }
}
