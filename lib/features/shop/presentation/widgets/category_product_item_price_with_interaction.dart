import 'package:flutter/material.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_product_interaction.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_price.dart';

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
