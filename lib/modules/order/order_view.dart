import 'package:flutter/material.dart';
import 'package:store_2/modules/order/order_view_body.dart';
import 'package:store_2/shared/style/colors.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String id = '/get_addresses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            Icons.shopping_bag_outlined,
            color: defaultColor,
          ),
          Text('Order'),
        ]),
      ),
      body: const OrderViewBody(),
    );
  }
}
