import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/address/get_address/address_item.dart';
import 'package:soagmb/modules/cart/order_sheet_components/address_order_item.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class AddressessItemListView extends StatefulWidget {
  const AddressessItemListView({
    super.key,
    required this.isFromDrawerNotOrderSheet,
  });

  final bool isFromDrawerNotOrderSheet;

  @override
  State<AddressessItemListView> createState() => _AddressessItemListViewState();
}

class _AddressessItemListViewState extends State<AddressessItemListView> {
  int isSelectedAddress = 0;
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
    List addressesList =
        addressCubit.getAddressesModel!.data!.addressModelsList;
    return SliverList.separated(
      itemCount: addressesList.length,
      itemBuilder: (context, index) {
        bool returnSelectedAddress() {
          if (addressCubit.addressModel != null) {
            return addressCubit.addressModel!.id == addressesList[index].id;
          } else {
            return isSelectedAddress == index;
          }
        }

        return widget.isFromDrawerNotOrderSheet
            ? AddressItem(addressModel: addressesList[index])
            : InkWell(
                onTap: () {
                  onTap(index, addressesList);
                },
                child: AddressOrderItem(
                  addressModel: addressesList[index],
                  isActive: returnSelectedAddress(),
                ),
              );
      },
      separatorBuilder: (context, index) => const Divider(
        endIndent: 20,
        indent: 20,
      ),
    );
  }

  void onTap(int index, List<dynamic> addressesList) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);

    setState(() {
      isSelectedAddress = index;
      // add the selected address to address cubit to use it
      // in addresses optoion in make order sheet to refrance it name
      // and in place order button
      addressCubit.addressModel = addressesList[index];
      addressCubit.checkSetState();
    });
  }
}
