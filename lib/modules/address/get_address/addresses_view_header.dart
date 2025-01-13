import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class AddressesViewHeader extends StatelessWidget {
  const AddressesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        const Text('Total Addresses :'),
        const Spacer(),
        Text(
            '(${BlocProvider.of<AddressCubit>(context).getAddressesModel!.data!.total.toString()})'),
        const SizedBox(width: 20),
      ],
    );
  }
}
