import 'package:flutter/material.dart';

void snacKBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        messege,
      ),
    ),
  );
}
