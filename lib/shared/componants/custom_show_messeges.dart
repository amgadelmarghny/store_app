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

void toastShown({required String messege, required Color backgroundColor}) {
  Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
