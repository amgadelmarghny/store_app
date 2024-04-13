import 'package:flutter/material.dart';

class CustomSmallDivider extends StatelessWidget {
  const CustomSmallDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 4,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(30),
          ),
        )
      ],
    );
  }
}
