import 'package:flutter/material.dart';
import 'package:soagmb/core/global/style/themes.dart';

class DisconnectedMaterialApp extends StatelessWidget {
  const DisconnectedMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.lightTheme(),
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('lib/core/global/assets/images/no-connection.png',height: 120,),
              SizedBox(
                height: 30,
              ),
              Text('Oops! 😓'),
              Text('No internet connection.'),
            ],
          ),
        ),
      ),
    );
  }
}
