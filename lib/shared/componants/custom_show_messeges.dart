import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void snacKBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        messege,
      ),
    ),
  );
}

void toastShown(
    {required String messege,
    required ToastState state,
    required BuildContext context}) {
  Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: getColorTost(state),
      textColor: Theme.of(context).textTheme.bodyLarge!.color,
      fontSize: 16.0);
}

enum ToastState { success, warning, error }

Color getColorTost(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.warning:
      color = Colors.yellow;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
  }
  return color;
}
