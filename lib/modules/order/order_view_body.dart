import 'package:flutter/material.dart';
import 'package:store_2/modules/order/new_orders_body.dart';
import 'package:store_2/shared/style/colors.dart';

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
                    color: defaultColor,
                  ),
                  Text(
                    'Order',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              bottom: TabBar(
                indicatorColor: defaultColor,
                tabs: const [
                  Tab(text: 'New'),
                  Tab(text: 'Cancelled'),
                ],
                overlayColor: MaterialStatePropertyAll(defaultColor.shade100),
                labelColor: defaultColor,
              ),
            )
          ];
        },
        body: const TabBarView(
          children: [
            NewOrdersBody(),
            NewOrdersBody(),
          ],
        ),
      ),
    );
  }
}
