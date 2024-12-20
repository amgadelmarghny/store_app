import 'package:flutter/material.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/modules/category/category_details/widgets/category_product_item_price_with_interaction.dart';

class CategoryProductItemInfoWithInteraction extends StatelessWidget {
  const CategoryProductItemInfoWithInteraction(
      {super.key, required this.productModel});
  final ProductModel productModel;

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
