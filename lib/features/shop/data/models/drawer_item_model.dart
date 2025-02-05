import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DrawerItemModel extends Equatable {
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

  @override
  List<Object?> get props => [iconData, title, routName, arguments];
}
