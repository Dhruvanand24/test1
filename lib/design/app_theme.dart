import 'package:flutter/material.dart';
import 'package:test1/design/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Urbanist",
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.scaffoldBgColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBgColor);
}
