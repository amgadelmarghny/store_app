import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/order/components/order_components/order_item.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/style/colors.dart';

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
          if (state is GetOrderFailure) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                  size: 200,
                ),
                Text('Something went wrong\nPlease try again later'),
              ],
            );
          }
          if (BlocProvider.of<AddressCubit>(context).getOrdersModel != null &&
              BlocProvider.of<AddressCubit>(context)
                  .cancelledOrdersList
                  .isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/empty_box.png',
                  height: 200,
                ),
                const Text('There is no cannceld order')
              ],
            );
          }
          return ConditionalBuilder(
            condition:
                BlocProvider.of<AddressCubit>(context).getOrdersModel != null &&
                    BlocProvider.of<AddressCubit>(context)
                        .cancelledOrdersList
                        .isNotEmpty,
            builder: (BuildContext context) {
              return ListView.separated(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return OrderItem(
                        color: Colors.red,
                        orderModel: BlocProvider.of<AddressCubit>(context)
                            .cancelledOrdersList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: BlocProvider.of<AddressCubit>(context)
                      .cancelledOrdersList
                      .length);
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
