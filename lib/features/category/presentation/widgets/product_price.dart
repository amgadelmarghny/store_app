import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.productModel});
  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productModel.price.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15),
        ),
        const Spacer(),
        if (productModel.discount != 0)
          Text(
            productModel.oldPrice.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
          ),
      ],
    );
  }
}
