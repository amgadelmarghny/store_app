import 'package:flutter/material.dart';
import 'package:soagmb/features/order/domain/entities/order.dart';
import 'package:soagmb/features/order/presentation/views/order_item_view.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/generated/l10n.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.color,
    required this.orderModel,
    required this.isNewOrderBody,
  });
  final Color color;
  final Order orderModel;
  final bool isNewOrderBody;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isNewOrderBody
          ? () {
              Navigator.pushNamed(context, OrderItemView.id,
                  arguments: orderModel.id);
            }
          : null,
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: color,
            )
          ],
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                CircleAvatar(
                  backgroundColor: defaultColor.shade300,
                  radius: 40,
                  child: FittedBox(
                    child: Text(orderModel.id.toString()),
                  ),
                ),
                Text(
                  S.of(context).id,
                  style: Theme.of(context).textTheme.bodySmall,
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
                        S.of(context).total_coast,
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
      ),
    );
  }
}
