import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/address/get_address/address_item.dart';
import 'package:soagmb/modules/cart/order_sheet_components/address_order_item.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class AddressessItemListView extends StatelessWidget {
  const AddressessItemListView({
    super.key,
    required this.isFromDrawerNotOrderSheet,
  });

  final bool isFromDrawerNotOrderSheet;

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);

    return SliverList.separated(
      itemCount: addressCubit.getAddressesModel!.data!.addressModelsList.length,
      itemBuilder: (context, index) {
        return isFromDrawerNotOrderSheet
            ? AddressItem(
                addressModel: addressCubit
                    .getAddressesModel!.data!.addressModelsList[index])
            : AddressOrderItem(
                addressModel: addressCubit
                    .getAddressesModel!.data!.addressModelsList[index]);
      },
      separatorBuilder: (context, index) => const Divider(
        endIndent: 20,
        indent: 20,
      ),
    );
  }
}
