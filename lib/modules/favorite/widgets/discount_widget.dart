import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key, this.margin,
  });

  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        'DISCOUNT',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}