import 'package:flutter/material.dart';
import 'package:store_2/modules/order/order_item/order_item_view_body.dart';
import 'package:store_2/modules/order/order_item/sliver_app_bar.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key});
  static const id = 'OrderItemView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverAppBarDelegate(expandedHeigh: 200),
          ),
          SliverToBoxAdapter(
            child: OrderItemViewBody(),
          )
        ],
      ),
    );
  }
}
