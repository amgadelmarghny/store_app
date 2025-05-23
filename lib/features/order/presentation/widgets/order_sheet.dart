import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/address_options.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/add_to_orders_dialog.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_small_divider.dart';
import 'package:soagmb/features/shop/presentation/widgets/payment_method_options.dart';
import 'package:soagmb/features/order/presentation/widgets/place_order_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/total_coast_list_tile.dart';
import 'package:soagmb/features/checkout/data/repository/checkout_repo.dart';

class OrderSheet extends StatelessWidget {
  const OrderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
        // this condition added to delete the address in cubit
        //  when no addresses available in list (app run state).
        // or the user delete all addresses those he added before,
        // and that will remove the last selected address name that
        // appear in order sheet.
        if (addressCubit.getAddressesModel != null &&
            addressCubit.getAddressesModel!.data!.addressModelsList.isEmpty) {
          addressCubit.addressModel = null;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSmallDivider(),
            const PaymentMethodOptions(),
            const Divider(),
            const AddressOptions(),
            const Divider(),
            TotalCoastListTile(),
            const SizedBox(height: 20),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PaymentCubit(CheckoutRepoImpl()),
                ),
                BlocProvider<OrderCubit>.value(
                  value: sl<OrderCubit>(),
                )
              ],
              child: BlocListener<OrderCubit, OrderState>(
                listener: (context, state) async {
                  ShopCubit shopCubit = ShopCubit.get(context);

                  if (state is AddOrderSuccess) {
                    if (state.addNewOrderModel.status) {
                      toastShown(
                        message: state.addNewOrderModel.message,
                        state: ToastState.success,
                        context: context,
                      );

                      if (context.mounted) {
                        Navigator.of(context).pop();
                        shopCubit.getHomeData();
                        showDialog(
                          context: context,
                          builder: (context) => AddToOrderDialog(),
                        );
                        await shopCubit.getCartItems();
                      }
                    } else {
                      toastShown(
                        message: state.addNewOrderModel.message,
                        state: ToastState.error,
                        context: context,
                      );
                    }
                  }
                  if (state is AddOrderFailure) {
                    if (context.mounted) snacKBar(context, state.error);
                  }
                },
                child: PlaceOrderButton(),
              ),
            ),
          ],
        );
      },
    );
  }
}
