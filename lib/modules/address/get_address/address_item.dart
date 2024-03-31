import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popover/popover.dart';
import 'package:store_2/models/address_models/address_model.dart';
import 'package:store_2/modules/address/get_address/menu_items.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class AddressItem extends StatefulWidget {
  const AddressItem({
    super.key,
    required this.addressModel,
  });

  final AddressModel addressModel;

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
        if (addressCubit.addressModel != null) {
          if (addressCubit.addressModel!.id == widget.addressModel.id) {
            isChecked = addressCubit.isChecked;
          }
        }
        return ListTile(
          leading: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
                addressCubit.isChecked = isChecked;
                addressCubit.addressModel = widget.addressModel;
                addressCubit.checkSetState();
              });
            },
          ),
          title: Text(widget.addressModel.name),
          subtitle: Text(
              '${widget.addressModel.city}, ${widget.addressModel.region}'),
          onTap: () {
            showPopover(
              backgroundColor: defaultColor[300]!,
              context: context,
              bodyBuilder: (context) => MenuItems(
                addressModelID: widget.addressModel.id,
              ),
              width: 250,
              height: 100,
            );
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
