import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/addresses_view_body.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});
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
        child: AddressesViewBody(
          isFromDrawerNotOrderSheet: isFromDrawerNotOrderSheet,
        ),
      ),
    );
  }
}
