import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    extensions: [
      CustomColors.light,
    ],
    canvasColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      unselectedItemColor: AppColors.white,
      unselectedIconTheme: IconThemeData(color: AppColors.green),
      selectedIconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyles.baseTextBold,
      bodyLarge: AppTextStyles.lMainTitle,
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    extensions: [
      CustomColors.dark,
    ],
    scaffoldBackgroundColor: AppColors.dBaseColor,
    canvasColor: AppColors.dBaseColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dBaseColor,
      unselectedItemColor: AppColors.white,
      unselectedIconTheme: IconThemeData(color: AppColors.green),
      selectedIconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyles.dBaseTextBold,
      bodyLarge: AppTextStyles.dMainTitle,
    ),
  );

  static bool isDark = false;
}
