import 'package:flutter/material.dart';

class OldPrice extends StatelessWidget {
  const OldPrice({
    super.key,
    required this.oldPrice,
    required this.text,
  });
  final String text;
  final String oldPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18,
              ),
        ),
        const Spacer(),
        Text(
          oldPrice,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.price,
  });
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
        const Spacer(),
        Text('EGP', style: Theme.of(context).textTheme.titleSmall!),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}