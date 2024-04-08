import 'package:flutter/material.dart';

class OrderItemViewBody extends StatelessWidget {
  const OrderItemViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: const [],
      ),
    );
  }
}
