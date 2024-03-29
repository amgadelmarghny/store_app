import 'package:flutter/material.dart';
import 'package:store_2/modules/address/add_new_address/add_address_view.dart';
import 'package:store_2/shared/style/colors.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MaterialButton(
            color: defaultColor.shade100,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            onPressed: () {
              Navigator.pushNamed(context, AddAddressView.id);
            },
            child: const Text('Add New Address'),
          ),
        ],
      ),
    );
  }
}
