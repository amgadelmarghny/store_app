import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/order_models/order_details_model.dart';
import 'package:store_2/modules/order/order_item/order_item_view_body.dart';
import 'package:store_2/modules/order/order_item/sliver_app_bar.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/style/colors.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key});
  static const id = 'OrderItemView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is OrderDetailsFaluir) {
            snacKBar(context, state.error);
          }
        },
        builder: (context, state) {
          OrderDetailsModel? orderDetailsModel =
              BlocProvider.of<AddressCubit>(context).orderDetailsModel;
          return ConditionalBuilder(
            condition:
                orderDetailsModel != null && state is! OrderDetailsLoading,
            builder: (context) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CustomSliverAppBarDelegate(
                      id: orderDetailsModel!.data!.id!,
                      status: orderDetailsModel.data!.status!,
                      date: orderDetailsModel.data!.date!,
                      expandedHeigh: 200,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: OrderItemViewBody(
                      orderId: orderDetailsModel.data!.id!,
                      name: orderDetailsModel.data!.addressModel!.name,
                      city: orderDetailsModel.data!.addressModel!.city,
                      region: orderDetailsModel.data!.addressModel!.region,
                      details: orderDetailsModel.data!.addressModel!.details,
                      note: orderDetailsModel.data!.addressModel!.notes,
                      productModelList: orderDetailsModel.data!.products!,
                      discount: orderDetailsModel.data!.discount,
                      coast: orderDetailsModel.data!.cost,
                      vat: orderDetailsModel.data!.vat,
                      total: orderDetailsModel.data!.total,
                    ),
                  )
                ],
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
