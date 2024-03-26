import 'package:flutter/material.dart';
import 'package:store_2/modules/order/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String id = '/get_addresses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            'lib/assets/images/order.png',
            color: Theme.of(context).iconTheme.color,
            height: 30,
          ),
          const Text('Order'),
        ]),
      ),
      body: const OrderViewBody(),
    );
  }
}
