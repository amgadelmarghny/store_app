// ignore_for_file: file_names
import 'package:flutter/material.dart';

void snackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }