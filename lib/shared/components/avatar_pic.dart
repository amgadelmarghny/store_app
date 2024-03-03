import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class AvatarPic extends StatelessWidget {
  const AvatarPic({
    super.key,
    required this.image,
    this.hight = 80,
  });

  final String image;
  final double hight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: hight,
      decoration:
          BoxDecoration(color: defaultColor[100], shape: BoxShape.circle),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.network(
          image,
        ),
      ),
    );
  }
}
