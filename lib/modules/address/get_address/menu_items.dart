import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/address_models/address_model.dart';
import 'package:store_2/modules/address/modify_address/update_address_view.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              UpdateAddressView.id,
              arguments: addressModel,
            );
          },
          height: 50,
          minWidth: 250,
          color: defaultColor[300],
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_note_sharp),
              Text(
                'Modify',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {
            BlocProvider.of<AddressCubit>(context)
                .deleteAddress(addressId: addressModel.id)
                .then((value) => Navigator.pop(context));
          },
          height: 50,
          minWidth: 250,
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
        ),
      ],
    );
  }
}
