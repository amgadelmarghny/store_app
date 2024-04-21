import 'package:flutter/material.dart';

class ProductCoast extends StatelessWidget {
  const ProductCoast({
    super.key,
    required this.number,
    required this.title,
  });
  final String title;
  final dynamic number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18)),
        Text(number.toString(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18)),
      ],
    );
  }
}
