import 'package:flutter/material.dart';
import 'package:Sourban/modules/order/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String id = '/get_addresses';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderViewBody(),
    );
  }
}
