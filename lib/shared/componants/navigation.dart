import 'package:flutter/material.dart';

void navigatorPushAndRemove(BuildContext context,String routNmae) {
  Navigator.pushNamedAndRemoveUntil(context,
   routNmae  , (route) => false);
}


