import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';
import 'package:soagmb/features/category/presentation/widgets/category_product_item_price_with_interaction.dart';

class CategoryProductItemInfoWithInteraction extends StatelessWidget {
  const CategoryProductItemInfoWithInteraction(
      {super.key, required this.productModel});
  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.name!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
        ),
        const SizedBox(
          height: 5,
        ),
        CategoryProductItemPriceWithInteraction(productModel: productModel)
      ],
    );
  }
}
