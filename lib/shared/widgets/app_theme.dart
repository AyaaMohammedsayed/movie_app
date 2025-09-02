import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF121312);
  static const Color blackPrimary = Color(0xFF000000);
  static const Color grey = Color(0xFF282A28);
  static const Color primary = Color(0xFFF6BD00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF57AA53);
  static const Color red = Color(0xFFE82626);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,

    appBarTheme: AppBarTheme(
      backgroundColor: black,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: grey,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: white,
      ),
    ),
  );
}
