import 'package:flutter/material.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/modules/category/category_details/widgets/category_product_cart_button.dart';
import 'package:soagmb/shared/components/add_to_favorite_button.dart';

class CategoryProductInteraction extends StatelessWidget {
  const CategoryProductInteraction({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryProductCartButton(productModel: productModel),
        //////////////!//////////////!//////////!
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, bottom: 6),
          child: AddToFavoriteButton(productModel: productModel),
        ),
      ],
    );
  }
}
