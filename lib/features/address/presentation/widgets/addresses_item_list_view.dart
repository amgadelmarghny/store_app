import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/address_item.dart';
import 'package:soagmb/features/address/presentation/widgets/address_order_item.dart';

class AddressesItemListView extends StatefulWidget {
  const AddressesItemListView({
    super.key,
    required this.isFromDrawerNotOrderSheet,
  });

  final bool isFromDrawerNotOrderSheet;

  @override
  State<AddressesItemListView> createState() => _AddressesItemListViewState();
}

class _AddressesItemListViewState extends State<AddressesItemListView> {
  int isSelectedAddress = 0;
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
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
                  onChanged: (value) {
                    onTap(index, addressesList);
                  },
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
