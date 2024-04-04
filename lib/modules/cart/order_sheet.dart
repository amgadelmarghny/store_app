import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/cart/order_sheet_components/address_options.dart';
import 'package:store_2/modules/cart/order_sheet_components/custpm_divider.dart';
import 'package:store_2/modules/cart/order_sheet_components/hint_text.dart';
import 'package:store_2/modules/cart/order_sheet_components/payment_method_options.dart';
import 'package:store_2/modules/cart/order_sheet_components/total_coast_list_tile.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';

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
        // and that will remove the last selected address name that
        // appear in  order sheet.
        if (addressCubit.getAddressesModel.data!.addressModelsList.isEmpty) {
          addressCubit.addressModel = null;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDivider(),
            const PaymantMethodOptions(),
            const Divider(),
            const AdressOptions(),
            const Divider(),
            TotalCoastListTile(total: total),
            const Divider(),
            const HintTextOrderSheet(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Take Order',
              isLoading: state is AddOrderLoading,
              onTap: () {
                addressCubit
                    .addNewOrder(
                  addressId: BlocProvider.of<AddressCubit>(context)
                              .addressModel !=
                          null
                      ? BlocProvider.of<AddressCubit>(context).addressModel!.id
                      : BlocProvider.of<AddressCubit>(context)
                          .getAddressesModel
                          .data!
                          .addressModelsList[0]
                          .id,
                  paymentMethod: addressCubit.selectedValue,
                  usePoints: false,
                )
                    .then((value) {
                  BlocProvider.of<ShopCubit>(context).getCartItems();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
