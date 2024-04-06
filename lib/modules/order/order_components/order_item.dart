import 'package:flutter/material.dart';
import 'package:store_2/models/order_models/get_orders_model.dart';
import 'package:store_2/shared/style/colors.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.color,
    required this.orderModel,
  });
  final Color color;
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: color,
            )
          ]),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              CircleAvatar(
                backgroundColor: defaultColor.shade300,
                radius: 50,
                child: Text(orderModel.id.toString()),
              ),
              Text(
                'ID',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "${orderModel.total.round()} EGP",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    orderModel.dateTime,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
