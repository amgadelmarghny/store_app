import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/widgets/empty_screen.dart';
import 'package:soagmb/core/global/widgets/failure_screen.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item_list_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/core/global/style/colors.dart';

class NewOrdersBody extends StatelessWidget {
  const NewOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is GetOrderFailure) {
            snacKBar(context, state.error);
          }
          if (state is GetOrderSuccess) {
            if (!state.getOrdersModel.status) {
              toastShown(
                message: state.getOrdersModel.message!,
                state: ToastState.error,
                context: context,
              );
            }
          }
        },
        builder: (context, state) {
          OrderCubit bloc = OrderCubit.get(context);
          if (state is GetOrderFailure) {
            return FailureScreen();
          }
          if (bloc.getOrdersModel != null && bloc.newOrdersList.isEmpty) {
            return EmptyScreen(itemName: 'order');
          }
          return ConditionalBuilder(
            condition:
                bloc.getOrdersModel != null && bloc.newOrdersList.isNotEmpty,
            builder: (BuildContext context) {
              return OrderItemListView(
                isNewOrderBody: true,
                  orderModelList: bloc.newOrdersList,
                  color: const Color.fromARGB(255, 255, 157, 0));
            },
            fallback: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
