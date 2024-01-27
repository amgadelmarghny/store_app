import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class IconItem extends StatelessWidget {
  const IconItem({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 29.5,
        backgroundColor: defaultColor,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          radius: 28,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.white,
            child: Image.asset(
              'lib/assets/images/google.png',
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
