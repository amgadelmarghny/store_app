import 'package:flutter/material.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item.dart';
import 'package:soagmb/models/order_models/get_orders_model.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({
    super.key,
    required this.orderModelList,
    required this.color,
    this.isNewOrderBody = false,
  });

  final List<OrderModel> orderModelList;
  final Color color;
  final bool isNewOrderBody;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
        itemCount: orderModelList.length);
  }
}
