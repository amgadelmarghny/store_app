import 'package:flutter/material.dart';

class DrawerItemModel {
  final IconData iconData;
  final String title;
  final String routName;
 final bool arguments;

  const DrawerItemModel({
    required this.iconData,
    required this.title,
    required this.routName,
    required this.arguments,
  });
}
