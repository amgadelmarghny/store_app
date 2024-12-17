import 'package:flutter/material.dart';
import 'package:soagmb/models/drawer_item_model.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.drawerItemModel});
  final DrawerItemModel drawerItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItemModel.iconData),
      title: Text(drawerItemModel.title),
      onTap: () {
        Navigator.pushNamed(
          context,
          drawerItemModel.routName,
          arguments: drawerItemModel.arguments,
        );
      },
    );
  }
}
