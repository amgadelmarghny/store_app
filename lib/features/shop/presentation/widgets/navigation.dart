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

void navigatorPush(context,Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
