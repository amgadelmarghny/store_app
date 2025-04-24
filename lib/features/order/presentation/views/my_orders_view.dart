import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/core/global/widgets/custom_refresh_page.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/order/presentation/widgets/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});
  static const String id = '/my_orders';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>.value(
      value: sl<OrderCubit>()..getAllOrders(),
      child: Scaffold(
        body: CustomRefreshPage(
            onRefresh: () async => sl<OrderCubit>()..getAllOrders(),
            child: MyOrdersViewBody()),
      ),
    );
  }
}
