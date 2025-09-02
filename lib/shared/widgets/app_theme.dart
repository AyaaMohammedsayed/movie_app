import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color primary = Color(0xffF6BD00);
  static const Color white = Color(0xffFFFFFF);
  static const Color blackSecondary = Color(0xff121312);
  static const Color blackPrimary = Color(0xff000000);
  static const Color grey = Color(0xff282A28);
  static const Color red = Color(0xffE82626);
  static ThemeData darkTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
    
      
      fillColor: grey,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        color: white,
      ),
     
      enabledBorder: OutlineInputBorder(
      
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
      
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
    scaffoldBackgroundColor: blackSecondary,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: primary,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: blackSecondary,
      )

    ),
    appBarTheme: AppBarTheme(
      color: blackSecondary,
      centerTitle: true,
      foregroundColor: primary,
    )
  );
}
