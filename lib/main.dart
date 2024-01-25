import 'package:flutter/material.dart';
import 'package:store_2/shared/style/themes.dart';

void main() {
  runApp(const StoreAp(),
  );
}

class StoreAp extends StatelessWidget {
  const StoreAp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeStyle.lightTheme(),
      darkTheme: ThemeStyle.darkTheme(),
    );
  }
}
