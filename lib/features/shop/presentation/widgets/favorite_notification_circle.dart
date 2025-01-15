import 'package:flutter/material.dart';

class FavoriteNotificationCircle extends StatelessWidget {
  const FavoriteNotificationCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -6,
      right: -6,
      child: Container(
        width: 12,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
