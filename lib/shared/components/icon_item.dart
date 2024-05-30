import 'package:flutter/material.dart';
import 'package:Sourban/shared/style/colors.dart';

class IconItem extends StatelessWidget {
  const IconItem({super.key, this.onTap, required this.image});
  final void Function()? onTap;
  final String image;
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
            radius: 17.5,
            backgroundColor: Colors.white,
            child: Image.asset(
              image,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
