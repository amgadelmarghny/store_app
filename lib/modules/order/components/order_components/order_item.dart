import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/order_models/get_orders_model.dart';
import 'package:soagmb/modules/order/components/order_item/order_item_view.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.color,
    required this.orderModel,
    this.isNewOrderBody = false,
  });
  final Color color;
  final OrderModel orderModel;
  final bool isNewOrderBody;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isNewOrderBody
          ? () {
              BlocProvider.of<AddressCubit>(context)
                  .getOrderDetails(id: orderModel.id);
              Navigator.pushNamed(context, OrderItemView.id);
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
                  'ID',
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
      ),
    );
  }
}
