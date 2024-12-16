import 'package:flutter/material.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/modules/category/category_details/widgets/category_product_interaction.dart';
import 'package:soagmb/shared/components/product_price.dart';

class CategoryProductItemPriceWithInteraction extends StatelessWidget {
  const CategoryProductItemPriceWithInteraction(
      {super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ProductPrice(productModel: productModel)),
        CategoryProductInteraction(productModel: productModel),
      ],
    );
  }
}
