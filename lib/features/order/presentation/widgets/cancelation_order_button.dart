import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/order/presentation/views/my_orders_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

class CancelationOrderButton extends StatefulWidget {
  const CancelationOrderButton({
    super.key,
    required this.orderId,
  });
  final int orderId;

  @override
  State<CancelationOrderButton> createState() => _CancelationOrderButtonState();
}

class _CancelationOrderButtonState extends State<CancelationOrderButton> {
  bool isOrderCancelable = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is CancelOrderSuccess) {
          if (state.cancelOrderModel.status) {
            toastShown(
                message: 'the order has been successfully cancelled',
                state: ToastState.success,
                context: context);
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, MyOrdersView.id);
          }
        }
        if (state is CancelOrderFailure) {
          snacKBar(context, state.error);
        }
      },
      builder: (context, state) {
        return MaterialButton(
          minWidth: 110,
          color: Colors.red[300],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          onPressed: () async {
            setState(() {
              isOrderCancelable = true;
            });
            await OrderCubit.get(context)
                .cancelTheOrder(orderId: widget.orderId);
          },
          child: ConditionalBuilder(
            condition: !isOrderCancelable,
            builder: (BuildContext context) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.block,
                    color: Colors.red[900],
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            },
            fallback: (context) => const SizedBox(
              height: 17,
              width: 17,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
          ),
        );
      },
    );
  }
}
