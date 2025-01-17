import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/order_item.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/core/global/style/colors.dart';

class NewOrdersBody extends StatelessWidget {
  const NewOrdersBody({super.key});

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
          AddressCubit bloc = AddressCubit.get(context);
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
          if (bloc.getOrdersModel != null && bloc.newOrdersList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/core/global/assets/images/empty_box.png',
                  height: 200,
                ),
                const Text('You haven\'t placed an order yet')
              ],
            );
          }
          return ConditionalBuilder(
            condition:
                bloc.getOrdersModel != null && bloc.newOrdersList.isNotEmpty,
            builder: (BuildContext context) {
              return ListView.separated(
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return OrderItem(
                    color: const Color.fromARGB(255, 255, 157, 0),
                    orderModel: bloc.newOrdersList[index],
                    isNewOrderBody: true,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: bloc.newOrdersList.length,
              );
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
