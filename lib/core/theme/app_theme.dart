import 'package:flutter/material.dart';

import '../color/colors.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.lightTheme : ThemeColors.darkTheme;
  }
}

class ThemeColors {
  const ThemeColors._();
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Arial Arabic',
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(
        background: lightBackgroundColor,
      ),
      scaffoldBackgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackgroundColor,
      ),
      textTheme: TextTheme(labelLarge: TextStyle(color: lightTextColor)));

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Arial Arabic',
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      background: darkBackgroundColor,
    ),
    scaffoldBackgroundColor: const Color(0xFF00040F),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      labelLarge: TextStyle(color: darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
    ),
  );
  static Brightness get currentSystemBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navigationBarColor => brightness == Brightness.light
      ? const Color(0xffF0F0F0)
      : const Color(0xFF00040F);
  //
  Color get textColor => brightness == Brightness.light
      ? const Color(0xFF403930)
      : const Color(0xFFFFF8F2);
  //
  Color get secondaryColor => const Color(0xFF2D3494); //
  //
  Gradient get serviceCard =>
      brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard =>
      brightness == Brightness.light ? grayWhite : contactGradi;

  TextStyle get logoTextStyle {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Arial Arabic Bold',
      foreground: Paint()
        ..shader = const LinearGradient(
          colors: <Color>[
            Color(0xFFFF0000), // Red at the top
            Color(0xFFFF0000), // Red at the border
            Color(0xFF0000FF), // Blue at the border
            Color(0xFF0000FF), // Blue at the bottom
          ],
          stops: <double>[
            0.0,
            0.49,
            0.51,
            1.0
          ], // Adjust stops for a clear border
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(const Rect.fromLTWH(
            0.0, 0.0, 200.0, 70.0)), // Adjust the Rect as needed
    );
  }
}
