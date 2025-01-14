import 'package:flutter/material.dart';
import 'package:soagmb/modules/order/cancelled_order_body.dart';
import 'package:soagmb/modules/order/new_orders_body.dart';
import 'package:soagmb/core/global/style/colors.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 25,
                  ),
                  Text(
                    'My Orders',
                    style: TextStyle(),
                  ),
                ],
              ),
              bottom: TabBar(
                indicatorColor: defaultColor,
                tabs: const [
                  Tab(text: 'New'),
                  Tab(text: 'Cancelled'),
                ],
                overlayColor: WidgetStatePropertyAll(defaultColor.shade100),
                labelColor: defaultColor,
              ),
            )
          ];
        },
        body: const TabBarView(
          children: [
            NewOrdersBody(),
            CancelledOrdersBody(),
          ],
        ),
      ),
    );
  }
}
