import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffF6BD00);
  static const Color white = Color(0xffFFFFFF);
  static const Color blackSecondary = Color(0xff121312);
  static const Color blackPrimary = Color(0xff000000);
  static const Color grey = Color(0xff282A28);
  static const Color red = Color(0xffE82626);
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: blackSecondary,
    appBarTheme: AppBarTheme(
      color: blackSecondary,
      centerTitle: true,
      foregroundColor: primary,
    )
  );
}
