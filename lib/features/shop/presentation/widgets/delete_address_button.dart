import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.addressId});
  final int addressId;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        BlocProvider.of<AddressCubit>(context)
            .deleteAddress(addressId: addressId)
            .then((value) {
          if (context.mounted) Navigator.pop(context);
        });
      },
      color: defaultColor[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete_outline,
            color: Colors.red.shade700,
          ),
          const Text(
            'Delete',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
