import 'package:flutter/material.dart';

void navigatorPushAndRemove(BuildContext context, String routName,
    {Object? arguments}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    arguments: arguments,
    routName,
    (route) => false,
  );
}
