import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:soagmb/core/global/style/colors.dart';

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
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration:
              BoxDecoration(color: defaultColor[100], shape: BoxShape.circle),
          child: Container(
            height: height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: FullScreenWidget(
              disposeLevel: DisposeLevel.Medium,
              child: CachedNetworkImage(
                fit: height == 80 ? BoxFit.cover : null,
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
          ),
        ),
      ),
    );
  }
}
