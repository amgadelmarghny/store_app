import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/address_models/address_model.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/style/colors.dart';

class AddressOrderItemLeading extends StatefulWidget {
  const AddressOrderItemLeading({super.key, required this.addressModel});
  final AddressModel addressModel;

  @override
  State<AddressOrderItemLeading> createState() =>
      _AddressOrderItemLeadingState();
}

class _AddressOrderItemLeadingState extends State<AddressOrderItemLeading> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
    );
  }
}