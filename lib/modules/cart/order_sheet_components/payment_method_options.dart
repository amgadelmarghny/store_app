import 'package:flutter/material.dart';

class PaymantMethodOptions extends StatelessWidget {
  const PaymantMethodOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Payment method'),
      onTap: () {},
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}