import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_product_interaction.dart';
import 'package:soagmb/features/category/presentation/widgets/product_price.dart';

class CategoryProductItemPriceWithInteraction extends StatelessWidget {
  const CategoryProductItemPriceWithInteraction(
      {super.key, required this.productModel});
  final Product productModel;

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
