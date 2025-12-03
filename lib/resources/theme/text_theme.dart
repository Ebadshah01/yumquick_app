import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';

class AppText {
  
  static TextTheme theme(ColorScheme scheme) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        fontSize: 20.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        color: themeWhiteColor,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontSize: 22.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: TextStyle(
        fontSize: 26.sp,
        color: scheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
