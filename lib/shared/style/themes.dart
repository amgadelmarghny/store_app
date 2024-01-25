import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeStyle {
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        iconTheme: IconThemeData(size: 30),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.tealAccent,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        iconTheme: IconThemeData(size: 30),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
        elevation: 20,
      ),
    );
  }
}
