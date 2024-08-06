import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/shared/style/colors.dart';

class AvatarPic extends StatelessWidget {
  const AvatarPic({
    super.key,
    required this.image,
    this.height = 80,
  });

  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: height,
      decoration:
          BoxDecoration(color: defaultColor[100], shape: BoxShape.circle),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: defaultColor,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.error_outline,
              size: 30,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
