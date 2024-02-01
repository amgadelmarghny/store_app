import 'package:flutter/material.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('Britness'),
          leading: Icon(Icons.brightness_6_outlined),
        ),
        Divider(),
        ListTile(
          title: Text('Language'),
          leading: Icon(Icons.translate_outlined),
        ),
      ],
    );
  }
}
