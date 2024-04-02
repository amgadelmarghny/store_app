import 'package:flutter/material.dart';
import 'package:store_2/modules/address/modify_address/modify_address_view_body.dart';

class UpdateAddressView extends StatelessWidget {
  const UpdateAddressView({super.key});
  static const id = "Update_address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Address'),
      ),
      body: const UpdateAddressBody(),
    );
  }
}
