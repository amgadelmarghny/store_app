import 'package:flutter/material.dart';
import 'package:store_2/modules/address/get_address/addresses_view_body.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});
  static const id = 'AddressesView';
  @override
  Widget build(BuildContext context) {
    bool isformDrowerNotOrderSheet =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Addresses'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: AddressesViewBody(
          isformDrowerNotOrderSheet: isformDrowerNotOrderSheet,
        ),
      ),
    );
  }
}
