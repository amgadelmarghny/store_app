import 'package:flutter/material.dart';
import 'package:soagmb/core/global/style/themes.dart';

class DisonnectionMaterialApp extends StatelessWidget {
  const DisonnectionMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.lightTheme(),
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/core/global/assets/images/no-connection.png'),
            SizedBox(
              height: 30,
            ),
            Text('Oops! 😓 \n No internet connection.'),
          ],
        ),
      ),
    );
  }
}
