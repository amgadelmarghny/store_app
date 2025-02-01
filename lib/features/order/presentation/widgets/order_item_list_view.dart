import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/order/domain/entities/order.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({
    super.key,
    required this.orderModelList,
    required this.color,
    this.isNewOrderBody = false,
  });

  final List<Order> orderModelList;
  final Color color;
  final bool isNewOrderBody;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: ListView.separated(
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return OrderItem(
              color: color,
              orderModel: orderModelList[index],
              isNewOrderBody: isNewOrderBody,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: orderModelList.length),
    );
  }
}
