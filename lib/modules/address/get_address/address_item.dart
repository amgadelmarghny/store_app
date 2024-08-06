import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popover/popover.dart';
import 'package:Sourban/models/address_models/address_model.dart';
import 'package:Sourban/modules/address/get_address/menu_items.dart';
import 'package:Sourban/shared/bloc/address_cubit/address_cubit.dart';
import 'package:Sourban/shared/style/colors.dart';

class AddressItem extends StatefulWidget {
  const AddressItem({
    super.key,
    required this.addressModel,
    this.isFromDrawerNotOrderSheet = false,
  });

  final AddressModel addressModel;
  final bool? isFromDrawerNotOrderSheet;

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
          if (addressCubit.addressModel! == widget.addressModel) {
            isChecked = addressCubit.isChecked;
          }
        }
        return ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!widget.isFromDrawerNotOrderSheet!)
                if (addressCubit.getAddressesModel!.data!.total! > 1)
                  Checkbox(
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
              CircleAvatar(
                backgroundColor: defaultColor.shade200,
                child: const Icon(Icons.location_on_outlined),
              ),
            ],
          ),
          title: Text(widget.addressModel.name),
          subtitle: Text(
              '${widget.addressModel.city}, ${widget.addressModel.region}'),
          trailing: IconButton(
            onPressed: () {
              showPopover(
                backgroundColor: defaultColor[300]!,
                context: context,
                bodyBuilder: (context) => MenuItems(
                  addressModel: widget.addressModel,
                ),
                width: MediaQuery.sizeOf(context).width / 1.5,
                height: 100,
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        );
      },
    );
  }
}
