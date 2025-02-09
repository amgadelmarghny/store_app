import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item_view_body.dart';
import 'package:soagmb/features/order/presentation/widgets/custom_order_item_success_screen_app_bar.dart';

class OrderItemSuceesScreen extends StatelessWidget {
  const OrderItemSuceesScreen({
    super.key,
    required this.orderDetailsDataModel,
  });

  final OrderDetailsData orderDetailsDataModel;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomOrderItemSuccessScreenAppBarDelegate(
              id: orderDetailsDataModel.id!,
              status: orderDetailsDataModel.status!,
              date: orderDetailsDataModel.date!,
              expandedHeight: 180,
            ),
          ),
          SliverToBoxAdapter(
            child: OrderItemViewBody(
              orderDetailsData: orderDetailsDataModel,
            ),
          )
        ],
      ),
    );
  }
}
