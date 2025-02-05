import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/add_to_favorite_button.dart';
import 'package:soagmb/features/category/presentation/widgets/product_price.dart';

class ProductItemInfoWithInteraction extends StatelessWidget {
  const ProductItemInfoWithInteraction({
    super.key,
    required this.productModel,
  });

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
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(height: 1.2),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                child: ProductPrice(productModel: productModel)),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 5, bottom: 6),
              child:
                  AddToFavoriteButton(productModel: productModel),
            ),
          ],
        ),
      ],
    );
  }
}