import 'package:flutter/material.dart';

class AppTheme {
  //app colors
  static const Color black = Color(0xff121312);
  static const Color grey = Color(0xff282A28);
  static const Color primary = Color(0xffFFBB3B);
  static const Color white = Color(0xffFFFFFF);
  static const Color green = Color(0xff57AA53);
  static const Color red = Color(0xffE82626);

  //app theme
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: grey,
      isDense: true,
      prefixIconColor: white,
      suffixIconColor: white,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: white,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: red),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.grey,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(color: grey, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      titleSmall: TextStyle(
        color: primary,
        decoration: TextDecoration.underline,
        decorationColor: primary,
        decorationThickness: 2,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
  static ThemeData lightTheme = ThemeData();
}
