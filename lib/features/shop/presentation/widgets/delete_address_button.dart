import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class DeleteAddressButton extends StatelessWidget {
  const DeleteAddressButton({super.key, required this.addressId});
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete_outline,
            color: Colors.red,
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
