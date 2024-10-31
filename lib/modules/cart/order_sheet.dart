import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/layout/shop/shop_view.dart';
import 'package:soagmb/modules/cart/order_sheet_components/address_options.dart';
import 'package:soagmb/modules/cart/order_sheet_components/custom_small_divider.dart';
import 'package:soagmb/modules/cart/order_sheet_components/hint_text.dart';
import 'package:soagmb/modules/cart/order_sheet_components/payment_method_options.dart';
import 'package:soagmb/modules/cart/order_sheet_components/place_order_button.dart';
import 'package:soagmb/modules/cart/order_sheet_components/total_coast_list_tile.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/components/navigation.dart';
import 'package:soagmb/shared/feature/checkout/data/presentation/manager/cubit/payment_cubit.dart';
import 'package:soagmb/shared/feature/checkout/data/repos/checkout_repo_impl.dart';

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
              message: state.addOrderModel.message,
              state: ToastState.success,
              context: context,
            );
            navigatorPushAndRemove(context, ShopView.id);
            BlocProvider.of<ShopCubit>(context).getCartItems();
            BlocProvider.of<ShopCubit>(context).getHomeData();
          } else {
            toastShown(
              message: state.addOrderModel.message,
              state: ToastState.error,
              context: context,
            );
          }
        }
        if (state is AddOrderFailure) {
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
            const PaymentMethodOptions(),
            const Divider(),
            const AddressOptions(),
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
