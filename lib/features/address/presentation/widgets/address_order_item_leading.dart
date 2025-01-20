import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class AddressOrderItemLeading extends StatelessWidget {
  const AddressOrderItemLeading(
      {super.key, required this.isActive, required this.onChanged});
  final bool isActive;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (BlocProvider.of<AddressCubit>(context)
                .getAddressesModel!
                .data!
                .total! >
            1)
          Checkbox(
            value: isActive,
            onChanged: onChanged,
            activeColor: defaultColor,
          ),
        CircleAvatar(
          backgroundColor: defaultColor.shade200,
          child: const Icon(Icons.location_on_outlined),
        ),
      ],
    );
  }
}
