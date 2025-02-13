import 'package:flutter/material.dart';
import 'package:soagmb/features/address/presentation/widgets/my_addresses_view_body.dart';

class MyAddressesView extends StatelessWidget {
  const MyAddressesView({super.key});
  static const id = 'AddressesView';
  @override
  Widget build(BuildContext context) {
    bool isFromDrawerNotOrderSheet =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Addresses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: MyAddressesViewBody(
          isAddressItemFromDrawerNotOrderSheet: isFromDrawerNotOrderSheet,
        ),
      ),
    );
  }
}
