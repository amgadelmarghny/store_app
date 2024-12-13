import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soagmb/shared/style/colors.dart';
import 'package:soagmb/shared/style/size_configs.dart';

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
      textTheme:  TextTheme(
        bodyLarge: TextStyle(
          fontSize: getResponsiveFontSize(fontSize: 19),
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: getResponsiveFontSize(fontSize: 18),
          color: defaultColor,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(fontSize:getResponsiveFontSize(fontSize: 15)),
        titleMedium: TextStyle(fontSize: getResponsiveFontSize(fontSize: 20)),
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
      textTheme:  TextTheme(
        bodyLarge: TextStyle(
          fontSize:getResponsiveFontSize(fontSize: 19),
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize:getResponsiveFontSize(fontSize: 18) ,
          color: defaultColor,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(fontSize: getResponsiveFontSize(fontSize: 15)),
        titleMedium: TextStyle(fontSize:getResponsiveFontSize(fontSize: 20)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
      ),
      fontFamily: GoogleFonts.amiri().fontFamily,
    );
  }
}

BoxDecoration customBoxDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).scaffoldBackgroundColor,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        spreadRadius: 0.3,
        blurRadius: 2,
        color: Colors.grey.withValues(alpha: 0.4),
        offset: const Offset(1, 5),
      )
    ],
  );
}

double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;

  double minFontSize = fontSize * 0.8;
  double maxFontSize = fontSize * 1.2;
  return responsiveFontSize.clamp(minFontSize, maxFontSize);
}

double getScaleFactor() {
  var platFormDispatcher = PlatformDispatcher.instance;
  var physicalWidth = platFormDispatcher.views.first.physicalSize.width;
  var pixelRatio = platFormDispatcher.views.first.devicePixelRatio;

  double width = physicalWidth / pixelRatio;

  if (width < SizeConfigs.tabletSizeWidth) {
    // font size for mobile
    return width / 400;
  } else {
    // font size for tablet
    return width / 800;
  }
}
