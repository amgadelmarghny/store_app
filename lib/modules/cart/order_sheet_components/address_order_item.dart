import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popover/popover.dart';
import 'package:soagmb/models/address_models/address_model.dart';
import 'package:soagmb/modules/address/get_address/menu_items.dart';
import 'package:soagmb/modules/address/modify_address/update_address_view.dart';
import 'package:soagmb/modules/cart/order_sheet_components/address_order_item_leading.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/style/colors.dart';

class AddressOrderItem extends StatelessWidget {
  const AddressOrderItem({
    super.key,
    required this.addressModel,
  });

  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        bool? isChecked = false;
        AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
        if (addressCubit.addressModel != null &&
            addressCubit.addressModel == addressModel) {
          isChecked = addressCubit.isChecked;
        }
        return ListTile(
          onTap: () => Navigator.pushNamed(
            context,
            UpdateAddressView.id,
            arguments: addressModel,
          ),
          leading: AddressOrderItemLeading(
            addressModel: addressModel,
          ),
          title: Text(addressModel.name),
          subtitle: Text('${addressModel.city}, ${addressModel.region}'),
          trailing: IconButton(
            onPressed: () {
              onPress(context);
            },
            icon: const Icon(Icons.more_vert),
          ),
        );
      },
    );
  }

  void onPress(BuildContext context) {
    showPopover(
      backgroundColor: defaultColor[300]!,
      context: context,
      bodyBuilder: (context) => MenuItems(
        addressModel: addressModel,
      ),
      width: MediaQuery.sizeOf(context).width / 1.5,
      height: 100,
    );
  }
}
