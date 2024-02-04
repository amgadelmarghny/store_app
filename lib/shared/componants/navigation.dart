import 'package:flutter/material.dart';

void navigatorPushAndRemove(BuildContext context,String routNmae,{Object? arguments}) {
  Navigator.pushNamedAndRemoveUntil(context,
  arguments:arguments,
   routNmae  , (route) => false);
}


