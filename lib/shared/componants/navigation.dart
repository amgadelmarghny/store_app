import 'package:flutter/material.dart';

void navigatorPushAndRemove(BuildContext context,Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}


