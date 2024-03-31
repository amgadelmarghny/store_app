import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.addressModelID});
  final int addressModelID;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {},
          height: 50,
          minWidth: 250,
          color: defaultColor[300],
          child: const Text(
            'Modify',
            style: TextStyle(fontSize: 20),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          height: 50,
          minWidth: 250,
          color: defaultColor[200],
          child: const Text(
            'Delete',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
