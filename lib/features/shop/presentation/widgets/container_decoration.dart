import 'package:flutter/material.dart';

BoxDecoration decorationBuilder(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).scaffoldBackgroundColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        blurRadius: 20,
        spreadRadius: 4,
        color: Colors.grey.withValues(alpha: 0.3),
      )
    ],
  );
}
