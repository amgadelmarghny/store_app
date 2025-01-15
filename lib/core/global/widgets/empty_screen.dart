import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.itemName});
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'lib/core/global/assets/images/empty_box.png',
          height: 200,
        ),
        Text('No $itemName found !'),
      ],
    );
  }
}
