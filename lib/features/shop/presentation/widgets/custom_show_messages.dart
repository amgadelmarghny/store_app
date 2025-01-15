import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void snacKBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
    ),
  );
}

void toastShown(
    {required String message,
    required ToastState state,
    required BuildContext context}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: getColorToast(state),
      textColor: Theme.of(context).textTheme.bodyLarge!.color,
      fontSize: 16.0);
}

enum ToastState { success, warning, error }

Color getColorToast(ToastState state) {
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
