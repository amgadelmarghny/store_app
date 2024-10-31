import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';

class CancllationButton extends StatefulWidget {
  const CancllationButton({
    super.key,
    required this.orderId,
  });
  final int orderId;

  @override
  State<CancllationButton> createState() => _CancllationButtonState();
}

class _CancllationButtonState extends State<CancllationButton> {
  bool isOrderCancellable = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is CancelOrderSuccess) {
          if (state.cancelOrderModel.status) {
            toastShown(
                message: 'the order has been successfully cancelled',
                state: ToastState.warning,
                context: context);
          }
        }
        if (state is CancelOrderFailure) {
          snacKBar(context, state.error);
        }
        if (state is GetOrderSuccess) {
          Navigator.pop(context);
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
          onPressed: () {
            setState(() {
              isOrderCancellable = true;
            });
            BlocProvider.of<AddressCubit>(context)
                .cancelTheOrder(orderId: widget.orderId);
          },
          child: ConditionalBuilder(
            condition: !isOrderCancellable,
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
            fallback: (BuildContext context) => const SizedBox(
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
