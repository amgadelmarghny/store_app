import 'package:flutter/material.dart';
import 'package:soagmb/features/order/presentation/widgets/cancelled_order_body.dart';
import 'package:soagmb/features/order/presentation/widgets/new_orders_body.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/generated/l10n.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 const Icon(
                    Icons.shopping_bag_outlined,
                    size: 25,
                  ),
                  Text(
                    S.of(context).my_orders,
                    style: TextStyle(),
                  ),
                ],
              ),
              bottom: TabBar(
                indicatorColor: defaultColor,
                tabs: [
                  Tab(text: S.of(context).new_keyword),
                  Tab(text: S.of(context).cancelled),
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
