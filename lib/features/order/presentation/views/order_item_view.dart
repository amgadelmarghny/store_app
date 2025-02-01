import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item_success_screen.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/core/global/style/colors.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key});
  static const id = 'OrderItemView';

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.settingsOf(context)!.arguments as int;
    return BlocProvider<OrderCubit>(
      create: (context) => sl()..getOrderDetails(id: id),
      child: Scaffold(
        body: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderDetailsFailure) {
              snacKBar(context, state.error);
            }
          },
          builder: (context, state) {
            OrderCubit cubit = OrderCubit.get(context);
            return ConditionalBuilder(
              condition: cubit.orderDetailsModel != null,
              builder: (context) {
                return OrderItemSuceesScreen(
                    orderDetailsDataModel: cubit.orderDetailsModel!.data!);
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
