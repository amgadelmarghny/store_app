import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    required this.discount,
    required this.oldPrice,
  });
  final dynamic price, oldPrice;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          price.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15),
        ),
        const Spacer(),
        if (discount != 0)
          Text(
            oldPrice.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
          ),
      ],
    );
  }
}
