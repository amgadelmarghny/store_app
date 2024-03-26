import 'package:flutter/material.dart';
import 'package:store_2/modules/address/add_new_address/add_address_view_body.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});
  static const id = '/Add-Address-View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Details'),
      ),
      body: const AddAddressViewBody(),
    );
  }
}
