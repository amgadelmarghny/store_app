import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soagmb/shared/style/colors.dart';

abstract class ThemeStyle {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: defaultColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleSpacing: 20,
        iconTheme: IconThemeData(size: 30),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        position: PopupMenuPosition.over,
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
        bodySmall: TextStyle(fontSize: 15),
        titleMedium: TextStyle(fontSize: 20),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
        elevation: 20,
      ),
      fontFamily: GoogleFonts.amiri().fontFamily,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: defaultColor,
      popupMenuTheme: const PopupMenuThemeData(
        position: PopupMenuPosition.under,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        // backgroundColor: defaultColor,
        titleSpacing: 20,
        iconTheme: IconThemeData(size: 30),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
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
        bodySmall: TextStyle(fontSize: 15),
        titleMedium: TextStyle(fontSize: 20),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
      ),
      fontFamily: GoogleFonts.amiri().fontFamily,
    );
  }
}
