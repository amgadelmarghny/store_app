import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/widgets/empty_screen.dart';
import 'package:soagmb/core/global/widgets/failure_screen.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item_list_view.dart';

class CancelledOrdersBody extends StatelessWidget {
  const CancelledOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: BlocConsumer<AddressCubit, AddressState>(
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
          AddressCubit cubit = AddressCubit.get(context);
          if (state is GetOrderFailure) {
            return const FailureScreen();
          }
          if (cubit.getOrdersModel != null &&
              cubit.cancelledOrdersList.isEmpty) {
            return EmptyScreen(itemName: 'canceled order');
          }
          return ConditionalBuilder(
            condition: cubit.getOrdersModel != null &&
                cubit.cancelledOrdersList.isNotEmpty,
            builder: (BuildContext context) {
              return OrderItemListView(
                orderModelList: cubit.cancelledOrdersList,
                color: Colors.red,
              );
            },
            fallback: (BuildContext context) {
              return const Center(
                  child: CircularProgressIndicator(
                color: defaultColor,
              ));
            },
          );
        },
      ),
    );
  }
}
