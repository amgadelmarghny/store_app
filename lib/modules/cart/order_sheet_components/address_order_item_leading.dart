import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/style/colors.dart';

class AddressOrderItemLeading extends StatelessWidget {
  const AddressOrderItemLeading({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (addressCubit.getAddressesModel!.data!.total! > 1)
          Checkbox(
            value: isActive,
            onChanged: (value) {},
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
