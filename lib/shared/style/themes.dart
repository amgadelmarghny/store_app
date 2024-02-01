import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_2/shared/style/colors.dart';

abstract class ThemeStyle {
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: defaultColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: defaultColor,
        titleSpacing: 20,
        iconTheme: IconThemeData(size: 30),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: defaultColor,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 19,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          color: defaultColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.tealAccent,
      ),
      fontFamily: GoogleFonts.amiri().fontFamily,
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: defaultColor,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleSpacing: 20,
        iconTheme: IconThemeData(size: 30),
        backgroundColor: defaultColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: defaultColor,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 19,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          color: defaultColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
        elevation: 20,
      ),
      fontFamily: GoogleFonts.amiri().fontFamily,
    );
  }
}
