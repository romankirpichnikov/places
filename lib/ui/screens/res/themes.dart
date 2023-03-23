import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    canvasColor: AppColors.dBaseColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dBaseColor,
      unselectedItemColor: AppColors.white,
      unselectedIconTheme: IconThemeData(color: AppColors.green),
      selectedIconTheme: IconThemeData(color: AppColors.white),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.dBaseColor,
    canvasColor: AppColors.dBaseColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dBaseColor,
      unselectedItemColor: AppColors.white,
      unselectedIconTheme: IconThemeData(color: AppColors.green),
      selectedIconTheme: IconThemeData(color: AppColors.white),
    ),
  );

  static bool isDark = false;
}
