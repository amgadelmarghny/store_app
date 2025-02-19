import 'package:flutter/material.dart';
import 'package:soagmb/generated/l10n.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.itemName});
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/core/global/assets/images/empty_box.png',
          height: 200,
        ),
        Text('${S.of(context).there_is_no} $itemName'),
      ],
    );
  }
}
