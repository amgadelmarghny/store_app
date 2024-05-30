import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/layout/shop/shop_view.dart';
import 'package:Sourban/modules/cart/order_sheet_components/address_options.dart';
import 'package:Sourban/modules/cart/order_sheet_components/custom_small_divider.dart';
import 'package:Sourban/modules/cart/order_sheet_components/hint_text.dart';
import 'package:Sourban/modules/cart/order_sheet_components/payment_method_options.dart';
import 'package:Sourban/modules/cart/order_sheet_components/place_order_button.dart';
import 'package:Sourban/modules/cart/order_sheet_components/total_coast_list_tile.dart';
import 'package:Sourban/shared/bloc/address_cubit/address_cubit.dart';
import 'package:Sourban/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:Sourban/shared/components/custom_show_messeges.dart';
import 'package:Sourban/shared/components/navigation.dart';
import 'package:Sourban/shared/feature/checkout/data/presentation/manager/cubit/payment_cubit.dart';
import 'package:Sourban/shared/feature/checkout/data/redos/checkout_repo_empl.dart';

class OrderSheet extends StatelessWidget {
  const OrderSheet({
    super.key,
    this.total,
  });
  final dynamic total;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          if (state.addOrderModel.status) {
            toastShown(
              messege: state.addOrderModel.message,
              state: ToastState.success,
              context: context,
            );
            navigatorPushAndRemove(context, ShopView.id);
            BlocProvider.of<ShopCubit>(context).getCartItems();
            BlocProvider.of<ShopCubit>(context).getHomeData();
          } else {
            toastShown(
              messege: state.addOrderModel.message,
              state: ToastState.error,
              context: context,
            );
          }
        }
        if (state is AddOrderFaluir) {
          snacKBar(context, state.error);
        }
      },
      builder: (context, state) {
        AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
        // this condition added to delete the address in cubit
        //  when no addresses available in list (app run state).
        // or the user delete all addresses those he added before,
        // and that will remove the last selected address name that
        // appear in order sheet.
        if (addressCubit.getAddressesModel!.data!.addressModelsList.isEmpty) {
          addressCubit.addressModel = null;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSmallDivider(),
            const PaymantMethodOptions(),
            const Divider(),
            const AdressOptions(),
            const Divider(),
            TotalCoastListTile(total: total),
            const Divider(),
            const HintTextOrderSheet(),
            const SizedBox(height: 20),
            BlocProvider(
              create: (context) => PaymentCubit(CheckoutRepoImpl()),
              child: PlaceOrderButton(
                amount: total,
                addressState: state,
              ),
            ),
          ],
        );
      },
    );
  }
}
